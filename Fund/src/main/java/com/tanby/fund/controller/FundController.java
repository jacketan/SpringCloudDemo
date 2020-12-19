package com.tanby.fund.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.ReUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.google.common.collect.Lists;
import com.mashape.unirest.http.Unirest;
import com.tanby.fund.model.FundEntity;
import com.tanby.fund.model.FundExtendEntity;
import com.tanby.fund.service.FundExtendService;
import com.tanby.fund.service.FundService;
import com.tanby.fund.utils.ExpireUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Function;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/fund")
@Slf4j
public class FundController {

    @Autowired
    private FundService service;

    @Autowired
    private FundExtendService extendService;

    private static final Integer WEEK = 1;
    private static final Integer MONTH = 2;
    private static final Integer THREE_MONTH = 4;
    private static final Integer SIX_MONTH = 8;
    private static final Integer YEAR = 16;

    @PostMapping("/add")
    public void add() throws Exception {
        String url = "http://fund.ijijin.cn/data/Net/info/all_F003N%20FUND33_desc_0_0_1_9999_0_0_0_jsonp_g.html";
        String body = Unirest.get(url).header("Content-Type", "text/html;charset=gbk").asString().getBody();
        String dataStr = body.substring(2, body.length() - 1);
        JSONObject jsonObject = JSONUtil.parseObj(dataStr);
        JSONObject dataObject = jsonObject.getJSONObject("data");
        JSONObject data = dataObject.getJSONObject("data");
        if (data.isEmpty()) {
            return;
        }

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
                                         @RequestParam(value = "code", defaultValue = "15") Integer code) {
        List<FundEntity> allList = Lists.newArrayList();
        AtomicInteger limit = new AtomicInteger(0);
        if ((code & WEEK) == WEEK) {
            allList.addAll(service.list(Wrappers.lambdaQuery(new FundEntity()).orderByDesc(FundEntity::getWeek).last(String.format("limit %d", days))));
            limit.addAndGet(1);
        }
        if ((code & MONTH) == MONTH) {
            allList.addAll(service.list(Wrappers.lambdaQuery(new FundEntity()).orderByDesc(FundEntity::getMonth).last(String.format("limit %d", days))));
            limit.addAndGet(1);
        }
        if ((code & THREE_MONTH) == THREE_MONTH) {
            allList.addAll(service.list(Wrappers.lambdaQuery(new FundEntity()).orderByDesc(FundEntity::getThreeMonth).last(String.format("limit %d", days))));
            limit.addAndGet(1);
        }
        if ((code & SIX_MONTH) == SIX_MONTH) {
            allList.addAll(service.list(Wrappers.lambdaQuery(new FundEntity()).orderByDesc(FundEntity::getSixMonth).last(String.format("limit %d", days))));
            limit.addAndGet(1);
        }
        if ((code & YEAR) == YEAR) {
            allList.addAll(service.list(Wrappers.lambdaQuery(new FundEntity()).orderByDesc(FundEntity::getYear).last(String.format("limit %d", days))));
            limit.addAndGet(1);
        }

        Map<String, List<FundEntity>> collect = allList.stream().collect(Collectors.groupingBy(FundEntity::getCode));
        List<FundEntity> fundEntityList = collect.entrySet().stream()
                .filter(entry -> entry.getValue().size() >= limit.get())
                .flatMap(entry -> entry.getValue().stream().distinct())
                .collect(Collectors.toList());

        return fundEntityList;
    }

    @PostMapping("/net/sync")
    public void syncNet() throws Exception {
        Function<String, String> function = code -> String.format("http://fund.10jqka.com.cn/ifindRank/commonTypeAvgFqNet/%s.json", code);
        Function<String, String> dwjzFunction = code -> String.format("http://fund.10jqka.com.cn/%s/json/jsondwjz.json", code);
        Function<String, String> ljjzFunction = code -> String.format("http://fund.10jqka.com.cn/%s/json/jsonljjz.json", code);
        DateTime dateTime = DateUtil.offsetDay(new Date(), -1);
        String yesterday = dateTime.toString("yyyy-MM-dd HH:mm:ss");

        List<FundEntity> fundEntities = service.list(Wrappers.lambdaQuery(new FundEntity()).select(FundEntity::getCode, FundEntity::getName));
        List<FundExtendEntity> fundExtendEntities = extendService.list(Wrappers.lambdaQuery(new FundExtendEntity()).select(FundExtendEntity::getCode).ge(FundExtendEntity::getUpdateDate, yesterday));
        List<String> codes = fundExtendEntities.stream().map(FundExtendEntity::getCode).collect(Collectors.toList());
        fundEntities = fundEntities.stream().filter(fundEntity -> !codes.contains(fundEntity.getCode())).collect(Collectors.toList());
        int processors = Runtime.getRuntime().availableProcessors();

        List<List<FundEntity>> list = CollUtil.split(fundEntities, fundEntities.size() / processors + 1);
        List<Future> futures = Lists.newArrayList();
        ExpireUtils expireUtils = ExpireUtils.build(DateField.HOUR, 1);
        list.forEach(fundEntitieList -> {
            futures.add(ThreadUtil.execAsync(() -> {
                List<FundExtendEntity> extendEntities = Lists.newArrayList();
                try {
                    for (FundEntity fundEntity : fundEntitieList) {
                        if (expireUtils.isExpire()) {
                            break;
                        }
                        boolean isEx;
                        do {
                            isEx = false;
                            try {
                                String body = Unirest.get(function.apply(fundEntity.getCode())).header("Content-Type", "application/json").asString().getBody();
                                String dwjzBody = Unirest.get(dwjzFunction.apply(fundEntity.getCode())).header("Content-Type", "application/json").asString().getBody();
                                String ljjzBody = Unirest.get(ljjzFunction.apply(fundEntity.getCode())).header("Content-Type", "application/json").asString().getBody();

                                if ((JSONUtil.isJson(body) || "".equals(body)) && ReUtil.contains("^var", dwjzBody) && ReUtil.contains("^var", ljjzBody)) {
                                    FundExtendEntity fundExtendEntity = new FundExtendEntity();
                                    fundExtendEntity.setCode(fundEntity.getCode());
                                    fundExtendEntity.setName(fundEntity.getName());
                                    fundExtendEntity.setNetJson(body);
                                    fundExtendEntity.setUpdateDate(new Date());

                                    String dwJson = dwjzBody.substring(dwjzBody.indexOf("["));
                                    String ljJson = ljjzBody.substring(ljjzBody.indexOf("["));

                                    fundExtendEntity.setDwjzJson(dwJson);
                                    fundExtendEntity.setLjjzJson(ljJson);

                                    // 计算连涨周数
                                    fundExtendEntity.setRiseWeek(calc(dwJson));
                                    extendEntities.add(fundExtendEntity);
                                } else {
                                    throw new RuntimeException();
                                }

                            } catch (Exception e) {
                                log.info("【发生异常时处理的基金数量:{}】", extendEntities.size());
                                isEx = true;
                                ThreadUtil.sleep(5 * 60 * 1000);
                            }
                        } while (isEx);
                    }

                    if (!extendEntities.isEmpty()) {
                        extendService.saveOrUpdateBatch(extendEntities);
                    }
                } catch (Exception e) {
                    log.info("【保存异常的数据:{}】", extendEntities);
                    log.error(e.getMessage(), e);
                }
            }));
        });

        for(Future future : futures) {
            future.get();
        }
    }

    private Integer calc(String body) {
        if (JSONUtil.isJsonArray(body)) {
            JSONArray jsonArray = JSONUtil.parseArray(body);
            JSONObject object = JSONUtil.createObj();
            jsonArray.forEach(data -> object.set(((JSONArray)data).getStr(0), ((JSONArray)data).get(1)));
            body = object.toString();
        }
        JSONObject data = JSONUtil.parseObj(body);

        List<String> dateList = data.keySet().stream().sorted(Comparator.reverseOrder()).collect(Collectors.toList());
        int week = 0;
        int flag = 0;
        for (int i = 0; i < dateList.size(); i += 5) {
            try {
                double result = data.getDouble(dateList.get(i)) - data.getDouble(dateList.get(i + 5));
                int temp = result > 0 ? 1 : result < 0 ? -1 : 0;
                if (i == 0) {
                    flag = temp;
                } else if (flag != temp) {
                    break;
                }
                week++;
            } catch (Exception e) {
                return week * flag;
            }

        }
        return week * flag;
    }

}
