package com.tanby.fund.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.ListUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Lists;
import com.mashape.unirest.http.Unirest;
import com.tanby.fund.model.FundEntity;
import com.tanby.fund.service.FundService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Wrapper;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@RestController
@RequestMapping("/fund")
public class FundController {

    @Autowired
    private FundService service;

    @PostMapping("/add")
    public void add() throws Exception {
        String url = "http://fund.ijijin.cn/data/Net/info/all_F003N%20FUND33_desc_0_0_1_9999_0_0_0_jsonp_g.html";
        String body = Unirest.get(url).header("Content-Type", "text/html;charset=gbk").asString().getBody();
        String dataStr = body.substring(2, body.length() - 1);
        JSONObject jsonObject = JSONUtil.parseObj(dataStr);
        JSONObject dataObject = jsonObject.getJSONObject("data");
        JSONObject data = dataObject.getJSONObject("data");

        // 清空数据
        service.clearAll();
        List<FundEntity> fundEntityList = new ArrayList<>(1000);
        data.forEach((key, value) -> {
            JSONObject object = (JSONObject) value;
            FundEntity fundEntity = new FundEntity();
            fundEntity.setCode(object.getStr("code"));
            fundEntity.setName(object.getStr("name"));
            fundEntity.setTypeName(object.getStr("typename"));
            fundEntity.setOrgId(object.getStr("orgid"));
            fundEntity.setOrgName(object.getStr("orgname"));
            fundEntity.setUpdateTime(new Date());
            fundEntity.setCreateDate(object.getDate("clrq"));

            fundEntity.setNewnet(object.getDouble("newnet"));
            fundEntity.setNewtotalnet(object.getDouble("newtotalnet"));
            fundEntity.setWeek(object.getDouble("F003N_FUND33"));
            fundEntity.setNearYear(object.getDouble("F005"));
            fundEntity.setMonth(object.getDouble("F008"));
            fundEntity.setThreeMonth(object.getDouble("F009"));
            fundEntity.setSixMonth(object.getDouble("F010"));
            fundEntity.setYear(object.getDouble("F011"));
            fundEntity.setTwoYear(object.getDouble("F014N_FUND33"));
            fundEntity.setThreeYear(object.getDouble("F015N_FUND33"));
            fundEntity.setAllTime(object.getDouble("F012"));

            fundEntityList.add(fundEntity);
            if (fundEntityList.size() == 1000) {
                service.saveBatch(fundEntityList);
                fundEntityList.clear();
            }
        });
        // 保持最后的数据
        service.saveBatch(fundEntityList);
    }

    @GetMapping("/rate/top")
    public List<FundEntity> getTopOfRate(@RequestParam(value = "days", defaultValue = "20") int days,
                                         @RequestParam(value = "containWeek", required = false) boolean containWeek) {
        List<FundEntity> monthList = service.list(Wrappers.lambdaQuery(new FundEntity()).orderByDesc(FundEntity::getMonth).last(String.format("limit %d", days)));
        List<FundEntity> threeMonthList = service.list(Wrappers.lambdaQuery(new FundEntity()).orderByDesc(FundEntity::getThreeMonth).last(String.format("limit %d", days)));
        List<FundEntity> sixMonthList = service.list(Wrappers.lambdaQuery(new FundEntity()).orderByDesc(FundEntity::getSixMonth).last(String.format("limit %d", days)));
        List<FundEntity> yearList = service.list(Wrappers.lambdaQuery(new FundEntity()).orderByDesc(FundEntity::getYear).last(String.format("limit %d", days)));

        List<FundEntity> allList = Lists.newArrayList();
        allList.addAll(monthList);
        allList.addAll(threeMonthList);
        allList.addAll(sixMonthList);
        allList.addAll(yearList);
        AtomicInteger limit = new AtomicInteger(4);
        if (containWeek) {
            List<FundEntity> weekList = service.list(Wrappers.lambdaQuery(new FundEntity()).orderByDesc(FundEntity::getWeek).last(String.format("limit %d", days)));
            yearList.addAll(weekList);
            limit.addAndGet(1);
        }

        Map<String, List<FundEntity>> collect = allList.stream().collect(Collectors.groupingBy(FundEntity::getCode));
        List<FundEntity> fundEntityList = collect.entrySet().stream()
                .filter(entry -> entry.getValue().size() >= limit.get())
                .flatMap(entry -> entry.getValue().stream().distinct())
                .collect(Collectors.toList());

        return fundEntityList;
    }
}
