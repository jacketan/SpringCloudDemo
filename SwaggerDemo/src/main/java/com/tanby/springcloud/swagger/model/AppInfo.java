package com.tanby.springcloud.swagger.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * @author tanbinyuan
 * @date 2019/12/13
 */
@Data
@ApiModel(value = "AppInfo", description = "应用信息")
public class AppInfo {

    @ApiModelProperty(value = "id", name = "id1", notes = "唯一编码")
    private String id;

    @ApiModelProperty(value = "appName", name = "appName1", notes = "应用名称")
    private String appName;

    @ApiModelProperty(value = "description", name = "description1", notes = "描述")
    private String description;
}
