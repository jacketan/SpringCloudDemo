package com.tanby.springcloud.excel;

import cn.hutool.core.io.resource.ClassPathResource;
import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelUtil;
import com.google.common.collect.Lists;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.*;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author tanbinyuan
 * @date 2020/4/2
 */
public class WudaExcel {

    private static FormulaEvaluator evaluator;

    private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    private static final String insertTemplate = "insert into wuda_temp (uid,user_name,identity,academy,phone,open_id) values \n";

    private static final String valueTemplate = "('%s','%s','%s','%s','%s','%s'),\n";

    public static void main(String[] args) {
        ClassPathResource classPathResource = new ClassPathResource("战疫openid及身份证查询-20200424.xls");
        ExcelReader reader = ExcelUtil.getReader(classPathResource.getFile());
        reader.setIgnoreEmptyRow(true);

        Workbook workbook = reader.getWorkbook();
        evaluator = workbook.getCreationHelper().createFormulaEvaluator();
        Sheet sheet = workbook.getSheetAt(0);

        int firstRowNum = sheet.getFirstRowNum();
        int lastRowNum = sheet.getLastRowNum();

        List<WudaTemp> wudaTempList = Lists.newArrayList();
        for (int i = firstRowNum + 1; i <= lastRowNum; i++) {
            Row row = sheet.getRow(i);
            short firstCellNum = row.getFirstCellNum();
            short lastCellNum = row.getLastCellNum();

            WudaTemp wudaTemp = new WudaTemp();
            for (int y = firstCellNum; y <= lastCellNum; y++) {
                Cell cell = row.getCell(y);
                String cellValue = getCellValue(cell);

                switch (y) {
                    case 0: wudaTemp.setUid(cellValue); break;
                    case 1: wudaTemp.setUserName(cellValue);break;
                    case 2: wudaTemp.setIdentity(cellValue); break;
                    case 3: wudaTemp.setAcademy(cellValue); break;
                    case 4: wudaTemp.setPhone(cellValue);break;
                    case 5: wudaTemp.setOpenId(cellValue); break;
                    default:break;
                }
            }

            wudaTempList.add(wudaTemp);
        }

        if (wudaTempList.size() <= 0) {
            return;
        }

        StringBuilder sb = new StringBuilder(insertTemplate);
        wudaTempList.stream().forEach(temp -> {
            sb.append(String.format(valueTemplate, temp.getUid(), temp.getUserName(), temp.getIdentity(),
                    temp.getAcademy(),temp.getPhone(), temp.getOpenId()));
        });

        int index = sb.lastIndexOf(",");
        sb.deleteCharAt(index);
        sb.append(";");

        System.out.println(sb.toString());
    }


    /**
     * @description: 将不同类型的单元格转换成字符串返回
     * @param: [cell 单元格]
     **/
    public static String getCellValue(Cell cell) {
        if (cell == null) {
            return "";
        }
        String cellValue;
        CellType cellType = cell.getCellType();
        //表达式类型
        if (cellType == CellType.FORMULA) {
            cellType = evaluator.evaluate(cell).getCellType();
        }
        switch (cellType) {
            case STRING:
                cellValue = cell.getStringCellValue().trim();
                cellValue = StrUtil.isEmpty(cellValue) ? "" : cellValue;
                break;
            case BOOLEAN:
                cellValue = String.valueOf(cell.getBooleanCellValue());
                break;
            case NUMERIC:
                if (HSSFDateUtil.isCellDateFormatted(cell)) {
                    cellValue = dateFormat.format(cell.getDateCellValue());
                } else if(58 == cell.getCellStyle().getDataFormat()){
                    SimpleDateFormat sdf = new SimpleDateFormat("M月d日");
                    Date javaDate = DateUtil.getJavaDate(cell.getNumericCellValue());
                    return sdf.format(javaDate);
                } else {
                    cellValue = new DecimalFormat("#.######").format(cell.getNumericCellValue());
                }
                break;
            default:
                //其它类型，取空字符串
                cellValue = "";
                break;
        }
        return cellValue;
    }
}
