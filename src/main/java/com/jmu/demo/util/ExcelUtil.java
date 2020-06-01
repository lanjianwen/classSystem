package com.jmu.demo.util;

import com.jmu.demo.entity.Student;
import lombok.Data;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.Id;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

@Data
public class ExcelUtil {
    /**
     * 得到excel文件内的用户集合
     *
     * @param mFile 上传的文件
     * @return 用户集合
     */
    public List<Student> getExcelInfo(MultipartFile mFile) {
        // 获取文件名
        String fileName = mFile.getOriginalFilename();
        List<Student> studentsList = null;
        try {
            if (!validateExcel(fileName)) {
                return null;
            }
            studentsList = createExcel(mFile.getInputStream(), fileName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studentsList;
    }

    /**
     * 判断是不是xls后缀的excel文件
     *
     * @param fileName 文件名
     */
    public static Boolean isXlsExcel(String fileName) {
        return fileName.matches("^.+\\.(?i)(xls)$");
    }

    /**
     * 判断是不是xlsx后缀的excel文件
     *
     * @param fileName 文件名
     */
    public static Boolean isXlsxExcel(String fileName) {
        return fileName.matches("^.+\\.(?i)(xlsx)$");
    }

    /**
     * 验证该文件是否为excel文件
     *
     * @param fileName 文件名
     */
    public Boolean validateExcel(String fileName) {
        Boolean isExcelFile = (fileName != null && (isXlsExcel(fileName) || isXlsxExcel(fileName)));
        return isExcelFile;
    }

    /**
     *
     * @param inputStream excel文件输入流
     * @param fileName 文件名
     * @return 用户集合
     */
    public List<Student> createExcel(InputStream inputStream, String fileName) {
        List<Student> studentsList = null;
        try {
            Workbook wb = null;
            // 判断类型，使用不同的Workbook
            if (isXlsExcel(fileName)) {
                wb = new HSSFWorkbook(inputStream);
            } else {
                wb = new XSSFWorkbook(inputStream);
            }
            studentsList = readExcelValue(wb);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return studentsList;
    }

    /**
     *
     * @param wb 工作薄
     * @return 用户集合
     */
    public List<Student> readExcelValue(Workbook wb) {
        List<Student> studentList = new ArrayList<>();
        // 总行数 总列数
        int totalRows, totalCells = 0;
        // 先得到一个sheet
        Sheet sheet = wb.getSheetAt(0);
        // 得到行数
        totalRows = sheet.getPhysicalNumberOfRows();
        // 得到excel里面的列，前提是有行
        // 大于1是因为我从第二行就是数据了，这个大家看情况而定
        if (totalRows > 1 && sheet.getRow(0) != null) {
            totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
        }
        for (int i = 1; i < totalRows; i++) {
            Row row = sheet.getRow(i);
            if (row == null) {
                continue;//如果行为空的话直接中断
            }
            Student student = new Student();
            for (int j = 0; j < totalCells; j++) {
                Cell cell = row.getCell(j);
                // cell先转化为String类型
                cell.setCellType(CellType.STRING);
                if (cell != null) {
                    if (j == 0) {
                        // 取姓名
                        student.setName(cell.getStringCellValue());
                    } else if (j == 1) {
                        student.setIdCard(cell.getStringCellValue());
                    } else if (j == 2) {
                        student.setSex(cell.getStringCellValue());
                    }
                    else if (j == 3){
                        student.setTotalGrade(Double.parseDouble(cell.getStringCellValue()));
                    }
                    else if (j == 4){
                        student.setType(cell.getStringCellValue());
                    }
                    else if (j == 5){
                        student.setNation(cell.getStringCellValue());
                    }
                    else if (j == 6){
                        student.setNativePlace(cell.getStringCellValue());
                    }
                    else if (j == 7){
                        student.setPatriarch(cell.getStringCellValue());
                    }
                    else if (j == 8){
                        student.setPhone(cell.getStringCellValue());
                    }
                    else if (j == 9){
                        student.setAddress(cell.getStringCellValue());
                    }
                    else if (j == 10){
                        student.setPriority(Integer.parseInt(cell.getStringCellValue()));
                    }
                }
            }
            studentList.add(student);
        }
        return studentList;
    }

    public void downloadExcel(OutputStream out, List<Student> studentList){
        //创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建Excel工作簿对象
        HSSFSheet sheet = workbook.createSheet("学生名单");


        String fileName = "userinf"  + ".xls";//设置要导出的文件的名字
        //新增数据行，并且设置单元格数据

        int rowNum = 1;

        String[] headers = { "姓名", "身份证号码", "性别", "总分", "编班类型", "民族", "籍贯",
                "监护人姓名", "联系电话", "家庭住址", "班级"};
        //headers表示excel表中第一行的表头

        HSSFRow row = sheet.createRow(0);
        //在excel表中添加表头

        for(int i=0;i<headers.length;i++){
            HSSFCell cell = row.createCell(i);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }

        //在表中存放查询到的数据放入对应的列
        if (studentList != null){
            for (Student student : studentList) {
                HSSFRow row1 = sheet.createRow(rowNum);
                row1.createCell(0).setCellValue(student.getName());
                row1.createCell(1).setCellValue(student.getIdCard());
                row1.createCell(2).setCellValue(student.getSex());
                row1.createCell(3).setCellValue(student.getTotalGrade());
                row1.createCell(4).setCellValue(student.getType());
                row1.createCell(5).setCellValue(student.getNation());
                row1.createCell(6).setCellValue(student.getNativePlace());
                row1.createCell(7).setCellValue(student.getPatriarch());
                row1.createCell(8).setCellValue(student.getPhone());
                row1.createCell(9).setCellValue(student.getAddress());
                row1.createCell(10).setCellValue(student.getClazz().getName());
                rowNum++;
            }
        }

        workbook.setSheetName(0,"学生名单");
        try
        {
            // 8.将Excel写入到输出流里面
            workbook.write(out);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

//        response.setContentType("application/octet-stream");
//        response.setHeader("Content-disposition", "attachment;filename=" + fileName);
//        response.flushBuffer();
//        workbook.write(response.getOutputStream());
    }

    public void downloadBlankExcel(OutputStream out){
        //创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建Excel工作簿对象
        HSSFSheet sheet = workbook.createSheet("学生名单");


        String fileName = "userinf"  + ".xls";//设置要导出的文件的名字
        //新增数据行，并且设置单元格数据

        int rowNum = 1;

        String[] headers = { "姓名", "身份证号码", "性别", "总分", "编班类型", "民族", "籍贯",
                "监护人姓名", "联系电话", "家庭住址", "优先级(越小优先级越高，优质生源为1，其它从2开始)"};
        //headers表示excel表中第一行的表头

        HSSFRow row = sheet.createRow(0);
        //在excel表中添加表头

        for(int i=0;i<headers.length;i++){
            HSSFCell cell = row.createCell(i);
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }

        try
        {
            // 8.将Excel写入到输出流里面
            workbook.write(out);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}