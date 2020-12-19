package com.tanby.fund.utils;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;

import java.util.Date;

public class ExpireUtils {

    private DateTime dateTime;

    private ExpireUtils(DateTime dateTime) {
        this.dateTime = dateTime;
    }

    public static ExpireUtils build(DateField dateField, int timeLength) {
        DateTime endTime = DateUtil.offset(new Date(), dateField, timeLength);
        return new ExpireUtils(endTime);
    }

    public boolean isExpire() {
        return this.dateTime.isBefore(new Date());
    }

}
