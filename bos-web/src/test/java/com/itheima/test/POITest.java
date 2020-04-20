package com.itheima.test;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.junit.Test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class POITest {

    @Test
    public void test01() throws IOException {
        // 使用POI 解析excle
        String filePath = "D:\\学习资料\\5第五阶段 项目实战一（19天）\\2.BOS物流管理系统（14天）\\BOS-day05\\BOS-day05\\资料\\区域导入测试数据.xls";
        // 包装一个 excle 文件对象
        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(new FileInputStream(new File(filePath)));
        // 读取文件中 第一个sheet 标签页
        HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
        // 遍历整个标签页
        for (Row row:hssfSheet){
            int rowNum = row.getRowNum();
            if (rowNum == 0){
                continue;
            }
            System.out.println();
            for (Cell cell:row){
                String value  = cell.getStringCellValue();
                System.out.print(value+" ");
            }
        }
    }
}
