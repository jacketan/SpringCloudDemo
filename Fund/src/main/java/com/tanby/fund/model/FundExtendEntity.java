package com.tanby.fund.model;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 *
 * @author nick
 * @email tanbinyuan@do1.com.cn
 * @date 2020-12-13 02:37:44
 */
@TableName("t_fund_extend")
@ApiModel(description = "")
@Data
public class FundExtendEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 基金编码
	 */
    @ApiModelProperty(value = "基金编码", example = "1000001")
    @TableId(type = IdType.INPUT)
    private String code;
	/**
	 * 基金名称
	 */
    @ApiModelProperty(value = "基金名称", example = "测试基金名称001")
    private String name;
	/**
	 * 基金所以净值数据
	 */
    @ApiModelProperty(value = "基金所以净值数据", example = "测试基金所以净值数据001")
    private String netJson;
	/**
	 * 连涨周数
	 */
    @ApiModelProperty(value = "连涨周数", example = "1")
    private Integer riseWeek;
	/**
	 * 更新时间
	 */
    @ApiModelProperty(value = "更新时间", example = "2018-08-08")
    private Date updateDate;
}
