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
 * @date 2020-12-12 16:26:19
 */
@TableName("t_fund_new")
@ApiModel(description = "")
@Data
public class FundNewEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 主键
	 */
    @ApiModelProperty(value = "主键", example = "1")
    @TableId(type = IdType.ID_WORKER)
    private Long id;
	/**
	 * 基金代码
	 */
    @ApiModelProperty(value = "基金代码", example = "测试基金代码001")
    private String code;
	/**
	 * 基金名称
	 */
    @ApiModelProperty(value = "基金名称", example = "测试基金名称001")
    private String name;
	/**
	 * 基金类型
	 */
    @ApiModelProperty(value = "基金类型", example = "测试基金类型001")
    private String type;

	/**
	 * 最新净值
	 */
	@ApiModelProperty(value = "最新净值", example = "1")
	private Double net;

	/**
	 * 最新累积净值
	 */
	@ApiModelProperty(value = "最新累积净值", example = "1")
	private Double totalnet;

	/**
	 * 近一周
	 */
    @ApiModelProperty(value = "近一周", example = "1")
    private Double week;
	/**
	 * 近一月
	 */
    @ApiModelProperty(value = "近一月", example = "1")
    private Double month;
	/**
	 * 近三个月
	 */
    @ApiModelProperty(value = "近三个月", example = "1")
    private Double threeMonth;
	/**
	 * 近6个月
	 */
    @ApiModelProperty(value = "近6个月", example = "1")
    private Double sixMonth;
	/**
	 * 近一年
	 */
    @ApiModelProperty(value = "近一年", example = "1")
    private Double year;
	/**
	 * 近两年
	 */
    @ApiModelProperty(value = "近两年", example = "1")
    private Double twoYear;
	/**
	 * 近三年
	 */
    @ApiModelProperty(value = "近三年", example = "1")
    private Double threeYear;
	/**
	 * 近一年
	 */
    @ApiModelProperty(value = "近一年", example = "1")
    private Double nearYear;
	/**
	 * 成立以来
	 */
    @ApiModelProperty(value = "成立以来", example = "1")
    private Double allTime;
	/**
	 * 
	 */
    @ApiModelProperty(value = "", example = "2018-08-08")
    private Date updateTime;
}
