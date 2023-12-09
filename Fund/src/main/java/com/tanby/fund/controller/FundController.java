package com.tanby.fund.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DatePattern;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ReUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSONPath;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.core.toolkit.support.SFunction;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.mashape.unirest.http.Unirest;
import com.tanby.fund.model.FundEntity;
import com.tanby.fund.model.FundExtendEntity;
import com.tanby.fund.model.FundNewEntity;
import com.tanby.fund.service.FundExtendService;
import com.tanby.fund.service.FundNewService;
import com.tanby.fund.service.FundService;
import com.tanby.fund.utils.ExpireUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.text.NumberFormat;
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
    private FundNewService newService;

    @Autowired
    private FundExtendService extendService;

    @Autowired
    private ThreadPoolTaskExecutor executor;

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
        // 保存最后的数据
        service.saveBatch(fundEntityList);

        addFromEastMoney();

        System.gc();
    }

    @PostMapping("/add/new")
    public void addNew() throws Exception {
        String url = "http://fund.ijijin.cn/data/Net/info/all_F009_desc_0_0_1_9999_0_0_0_jsonp_g.html";
        String body = Unirest.get(url).header("Content-Type", "text/html;charset=gbk").asString().getBody();
        String dataStr = body.substring(2, body.length() - 1);
        JSONObject jsonObject = JSONUtil.parseObj(dataStr);
        JSONObject dataObject = jsonObject.getJSONObject("data");
        JSONObject data = dataObject.getJSONObject("data");
        if (data.isEmpty()) {
            return;
        }

        // 清空数据
        newService.clearAll();
        List<FundNewEntity> fundEntityList = new ArrayList<>(1000);
        data.forEach((key, value) -> {
            JSONObject object = (JSONObject) value;
            FundNewEntity fundEntity = new FundNewEntity();
            fundEntity.setCode(object.getStr("code"));
            fundEntity.setName(object.getStr("name"));
            fundEntity.setType(object.getStr("type"));
            fundEntity.setUpdateTime(new Date());

            fundEntity.setNet(object.getDouble("net"));
            fundEntity.setTotalnet(object.getDouble("totalnet"));
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
                newService.saveBatch(fundEntityList);
                fundEntityList.clear();
            }
        });
        // 保存最后的数据
        newService.saveBatch(fundEntityList);

        addFromEastMoney();

        System.gc();
    }

    @PostMapping("/eastMoney/add")
    public void addFromEastMoney() throws Exception{
        String url = "http://fund.eastmoney.com/data/rankhandler.aspx";
        String[] types = {"zs", "gp", "hh"};
        List<String> codes = service.queryLackCode();
        List<FundNewEntity> fundEntityList = new ArrayList<>(1000);
        for (String type : types) {
            Map<String, Object> param = buildParam(type);
            String body = Unirest.get(url).header("Referer", "http://fund.eastmoney.com/data/fundranking.html").queryString(param).asString().getBody();
            String dataStr = ReUtil.get("\\[.*\\]", body, 0);
            JSONArray dataList = JSONUtil.parseArray(dataStr);
            dataList.forEach(o -> {
                String data = JSONUtil.toJsonStr(o);
                String[] fundDetails = StrUtil.removeAll(data, "\"").split("\\,");
                if (ArrayUtil.isEmpty(fundDetails) || codes.contains(fundDetails[0])) {
                    return;
                }
                FundNewEntity fundEntity = new FundNewEntity();
                fundEntity.setCode(fundDetails[0]);
                fundEntity.setName(fundDetails[1]);
                fundEntity.setType(type + "x");
                fundEntity.setUpdateTime(new Date());

                fundEntity.setNet(Convert.toDouble(fundDetails[4]));
                fundEntity.setTotalnet(Convert.toDouble(fundDetails[5]));
                fundEntity.setWeek(Convert.toDouble(fundDetails[7]));
                fundEntity.setNearYear(Convert.toDouble(fundDetails[14]));
                fundEntity.setMonth(Convert.toDouble(fundDetails[8]));
                fundEntity.setThreeMonth(Convert.toDouble(fundDetails[9]));
                fundEntity.setSixMonth(Convert.toDouble(fundDetails[10]));
                fundEntity.setYear(Convert.toDouble(fundDetails[11]));
                fundEntity.setTwoYear(Convert.toDouble(fundDetails[12]));
                fundEntity.setThreeYear(Convert.toDouble(fundDetails[13]));
                fundEntity.setAllTime(Convert.toDouble(fundDetails[15]));

                fundEntityList.add(fundEntity);
                if (fundEntityList.size() == 1000) {
                    newService.saveBatch(fundEntityList);
                    fundEntityList.clear();
                }
            });
        }

        // 保存最后的数据
        newService.saveBatch(fundEntityList);
    }

    private Map<String, Object> buildParam(String type) {
        Map<String, Object> param = Maps.newHashMap();
        param.put("op", "ph");
        param.put("dt", "kf");
        param.put("ft", type);
        param.put("rs", "");
        param.put("gs", "0");
        param.put("sc", "1nzf");
        param.put("st", "desc");
        param.put("sd", DateUtil.format(DateUtil.offsetMonth(new Date(), -12), DatePattern.NORM_DATE_PATTERN));
        param.put("ed", DateUtil.format(new Date(), DatePattern.NORM_DATE_PATTERN));
        param.put("qdii", "");
        param.put("tabSubtype", ",,,,,");
        param.put("pi", "1");
        param.put("pn", "10000");
        param.put("dx", "1");
        param.put("v", "0.8715405289402929");

        return param;
    }

    @GetMapping("/rate/top")
    public List<FundEntity> getTopOfRate(@RequestParam(value = "days", defaultValue = "20") int days,
                                         @RequestParam(value = "code", defaultValue = "15") Integer code) {
        List<FundEntity> allList = Lists.newArrayList();
        AtomicInteger limit = new AtomicInteger(0);
        Function<SFunction<FundEntity,?>,Wrapper<FundEntity>> function = (orderBy) -> Wrappers.lambdaQuery(new FundEntity()).in(FundEntity::getTypeName, "混合型", "股票型").orderByDesc(orderBy).last(String.format("limit %d", days));
        if ((code & WEEK) == WEEK) {
            allList.addAll(service.list(function.apply(FundEntity::getWeek)));
            limit.addAndGet(1);
        }
        if ((code & MONTH) == MONTH) {
            allList.addAll(service.list(function.apply(FundEntity::getMonth)));
            limit.addAndGet(1);
        }
        if ((code & THREE_MONTH) == THREE_MONTH) {
            allList.addAll(service.list(function.apply(FundEntity::getThreeMonth)));
            limit.addAndGet(1);
        }
        if ((code & SIX_MONTH) == SIX_MONTH) {
            allList.addAll(service.list(function.apply(FundEntity::getSixMonth)));
            limit.addAndGet(1);
        }
        if ((code & YEAR) == YEAR) {
            allList.addAll(service.list(function.apply(FundEntity::getYear)));
            limit.addAndGet(1);
        }

        Map<String, List<FundEntity>> collect = allList.stream().collect(Collectors.groupingBy(FundEntity::getCode));
        List<FundEntity> fundEntityList = collect.entrySet().stream()
                .filter(entry -> entry.getValue().size() >= limit.get())
                .flatMap(entry -> entry.getValue().stream().distinct())
                .collect(Collectors.toList());

        return fundEntityList;
    }

    @GetMapping("/rate/top/new")
    public List<FundNewEntity> getTopOfRateNew(@RequestParam(value = "days", defaultValue = "20") int days,
                                         @RequestParam(value = "code", defaultValue = "15") Integer code) {
        List<FundNewEntity> allList = Lists.newArrayList();
        AtomicInteger limit = new AtomicInteger(0);
        Function<SFunction<FundNewEntity,?>,Wrapper<FundNewEntity>> function = (orderBy) -> Wrappers.lambdaQuery(new FundNewEntity()).in(FundNewEntity::getType, "hhx", "gpx").orderByDesc(orderBy).last(String.format("limit %d", days));
        if ((code & WEEK) == WEEK) {
            allList.addAll(newService.list(function.apply(FundNewEntity::getWeek)));
            limit.addAndGet(1);
        }
        if ((code & MONTH) == MONTH) {
            allList.addAll(newService.list(function.apply(FundNewEntity::getMonth)));
            limit.addAndGet(1);
        }
        if ((code & THREE_MONTH) == THREE_MONTH) {
            allList.addAll(newService.list(function.apply(FundNewEntity::getThreeMonth)));
            limit.addAndGet(1);
        }
        if ((code & SIX_MONTH) == SIX_MONTH) {
            allList.addAll(newService.list(function.apply(FundNewEntity::getSixMonth)));
            limit.addAndGet(1);
        }
        if ((code & YEAR) == YEAR) {
            allList.addAll(newService.list(function.apply(FundNewEntity::getYear)));
            limit.addAndGet(1);
        }

        Map<String, List<FundNewEntity>> collect = allList.stream().collect(Collectors.groupingBy(FundNewEntity::getCode));
        List<FundNewEntity> fundEntityList = collect.entrySet().stream()
                .filter(entry -> entry.getValue().size() >= limit.get())
                .flatMap(entry -> entry.getValue().stream().distinct())
                .collect(Collectors.toList());

        return fundEntityList;
    }

    @PostMapping("/net/sync")
    public Integer syncNet() throws Exception {
        Function<String, String> dwjzFunction = code -> String.format("http://fund.10jqka.com.cn/%s/json/jsondwjz.json", code);
        Function<String, String> ljjzFunction = code -> String.format("http://fund.10jqka.com.cn/%s/json/jsonljjz.json", code);
        Function<String, String> themeFunction = code -> String.format("http://fund.10jqka.com.cn/data/client/myfund/%s", code);

        List<FundEntity> fundEntities = service.querySyncList();
        int processors = Runtime.getRuntime().availableProcessors();

        List<List<FundEntity>> list = CollUtil.split(fundEntities, fundEntities.size() / processors + 1);
        List<Future> futures = Lists.newArrayList();
        ExpireUtils expireUtils = ExpireUtils.build(DateField.HOUR, 1);
        list.forEach(fundEntitieList -> {
            futures.add(executor.submit(() -> {
                List<FundExtendEntity> extendEntities = Lists.newArrayList();
                try {
                    fund:
                    for (FundEntity fundEntity : fundEntitieList) {
                        if (expireUtils.isExpire()) {
                            break;
                        }
                        boolean isEx;
                        do {
                            isEx = false;
                            try {
                                String dwjzBody = Unirest.get(dwjzFunction.apply(fundEntity.getCode())).header("Content-Type", "application/json").asString().getBody();
                                String ljjzBody = Unirest.get(ljjzFunction.apply(fundEntity.getCode())).header("Content-Type", "application/json").asString().getBody();
                                String themeBody = Unirest.get(themeFunction.apply(fundEntity.getCode())).header("Content-Type", "application/json").asString().getBody();

                                if (ReUtil.contains("^var", dwjzBody) && ReUtil.contains("^var", ljjzBody) && JSONUtil.isJson(themeBody)) {
                                    FundExtendEntity fundExtendEntity = new FundExtendEntity();
                                    fundExtendEntity.setCode(fundEntity.getCode());
                                    fundExtendEntity.setName(fundEntity.getName());
                                    fundExtendEntity.setUpdateDate(new Date());

                                    String dwJson = dwjzBody.substring(dwjzBody.indexOf("["));
                                    String ljJson = ljjzBody.substring(ljjzBody.indexOf("["));

                                    fundExtendEntity.setDwjzJson(dwJson);
                                    fundExtendEntity.setLjjzJson(ljJson);
                                    fundExtendEntity.setTheme(JSONPath.read(themeBody, "$.data[0].themeList[*].field_name").toString());

                                    // 计算连涨周数
                                    calc(ljJson, fundExtendEntity);
                                    extendEntities.add(fundExtendEntity);
                                } else if (StringUtils.isBlank(dwjzBody) || StringUtils.isBlank(ljjzBody)) {
                                    continue fund;
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
                return extendEntities.size();
            }));
        });

        try {
            int size = 0;
            for(Future future : futures) {
                size += (Integer) future.get();
            }

            return size;
        } finally {
            System.gc();
        }
    }

    @GetMapping("/week/rate")
    public Object getWeekRate(@RequestParam("code") String code,
                              @RequestParam(value = "isLj", defaultValue = "true") boolean isLj) {
        FundExtendEntity entity = extendService.getById(code);
        if (Objects.isNull(entity)) {
            return Lists.newArrayList();
        }
        String ljjzJson = entity.getLjjzJson();
        if (!isLj) {
            ljjzJson = entity.getDwjzJson();
        }
        List<Double> jzList = JSONUtil.parseArray(ljjzJson).stream().map(week -> ((JSONArray) week).getDouble(1)).collect(Collectors.toList());
        jzList = CollUtil.reverse(jzList);

        List<String> rateList = Lists.newArrayList();
        double max = 0;
        double min = 0;
        List<Integer> upList = Lists.newArrayList();
        List<Integer> downList = Lists.newArrayList();
        int count = 0;
        double lastResult = 0;
        NumberFormat format = DecimalFormat.getPercentInstance();
        format.setMinimumFractionDigits(2);
        for (int i = 0; i < jzList.size() - 5; i=i+5) {
            double result = (jzList.get(i) - jzList.get(i+5)) / jzList.get(i+5);
            // 计算最大最小值
            if (max < result) {
                max = result;
            } else if (min > result) {
                min = result;
            }
            // 判断符号位是否变更
            if (i != 0 && lastResult * result < 0) {
                if (lastResult > 0) {
                    upList.add(count);
                } else if (lastResult < 0) {
                    downList.add(count);
                }
                count = 1;
            } else {
                count++;
            }
            lastResult = result;
            String rate = format.format(result);
            rateList.add(rate);
        }
        if (lastResult > 0) {
            upList.add(count);
        } else {
            downList.add(count);
        }
        Map<String, Object> data = Maps.newLinkedHashMap();
        data.put("max", format.format(max));
        data.put("min", format.format(min));
        data.put("up", CollUtil.sort(upList, Comparator.reverseOrder()).get(0));
        data.put("down", CollUtil.sort(downList, Comparator.reverseOrder()).get(0));
        data.put("list", rateList);
        return data;
    }

    private void calc(String body, FundExtendEntity fundExtendEntity) {
        if (JSONUtil.isJsonArray(body)) {
            JSONArray jsonArray = JSONUtil.parseArray(body);
            JSONObject object = JSONUtil.createObj();
            jsonArray.forEach(data -> object.set(((JSONArray)data).getStr(0), ((JSONArray)data).get(1)));
            body = object.toString();
        }
        JSONObject data = JSONUtil.parseObj(body);

        List<String> dateList = data.keySet().stream().sorted(Comparator.reverseOrder()).collect(Collectors.toList());
        // 计算周连涨数
        fundExtendEntity.setRiseWeek(calcWeek(data, dateList));
        // 计算10、15、20、30天平均数与当前最新值的浮动率
        fundExtendEntity.setTen(calcAvgRate(data, dateList, 10));
        fundExtendEntity.setFifteen(calcAvgRate(data, dateList, 15));
        fundExtendEntity.setTwenty(calcAvgRate(data, dateList, 20));
        fundExtendEntity.setThirty(calcAvgRate(data, dateList, 30));
    }

    private BigDecimal calcAvgRate(JSONObject data, List<String> dateList, int days) {
        BigDecimal total = BigDecimal.ZERO;
        BigDecimal now = BigDecimal.ZERO;
        for (int i = 0; i < days; i++) {
            BigDecimal dayVal = BigDecimal.valueOf(data.getDouble(dateList.get(i)));
            if (i == 0) {
                now = dayVal;
            }
            total = total.add(dayVal);
        }
        BigDecimal avg = total.divide(BigDecimal.valueOf(days), 2, RoundingMode.HALF_UP);
        // 计算当前值减去平均值后的升降比率
        return now.subtract(avg).divide(avg, 2, RoundingMode.HALF_UP);
    }

    private Integer calcWeek(JSONObject data, List<String> dateList) {
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
