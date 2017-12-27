package com.qams.util;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.xmlbeans.impl.regex.ParseException;

import com.qams.bean.ExcelMapping;

public class XssfExcel {
	private static XSSFCellStyle fontStyle, fontStyle2;

	/**
	 * 多列头创建EXCEL
	 * 
	 * @param sheetName
	 *            工作簿名称
	 * @param clazz
	 *            数据源model类型
	 * @param objs
	 *            excel标题列以及对应model字段名
	 * @param map
	 *            标题列行数以及cell字体样式
	 * @return
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 * @throws ClassNotFoundException
	 * @throws IntrospectionException
	 * @throws ParseException
	 */
	public static XSSFWorkbook createExcelFile(Class clazz, List objs,
			Map<Integer, List<ExcelMapping>> map, String sheetName)
			throws IllegalArgumentException, IllegalAccessException,
			InvocationTargetException, ClassNotFoundException,
			IntrospectionException, ParseException {
		// 创建新的Excel 工作簿
		XSSFWorkbook workbook = new XSSFWorkbook();
		// 在Excel工作簿中建一工作表，其名为缺省值, 也可以指定Sheet名称
		XSSFSheet sheet = workbook.createSheet(sheetName);
		// 以下为excel的字体样式以及excel的标题与内容的创建，下面会具体分析;
		createFont(workbook);// 字体样式
		createTableHeader(sheet, map);// 创建标题（头）
		createTableRows(sheet, map, objs, clazz);// 创建内容
		return workbook;
	}

	public static void createFont(XSSFWorkbook workbook) {
		// 表头
		XSSFCellStyle fontStyle = workbook.createCellStyle();
		XSSFFont font1 = workbook.createFont();
		font1.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
		font1.setFontName("黑体");
		font1.setFontHeightInPoints((short) 14);// 设置字体大小
		fontStyle.setFont(font1);
		fontStyle.setBorderBottom(XSSFCellStyle.BORDER_THIN); // 下边框
		fontStyle.setBorderLeft(XSSFCellStyle.BORDER_THIN);// 左边框
		fontStyle.setBorderTop(XSSFCellStyle.BORDER_THIN);// 上边框
		fontStyle.setBorderRight(XSSFCellStyle.BORDER_THIN);// 右边框
		fontStyle.setAlignment(XSSFCellStyle.ALIGN_CENTER); // 居中
		XssfExcel.fontStyle = fontStyle;
		// 内容
		XSSFCellStyle fontStyle2 = workbook.createCellStyle();
		XSSFFont font2 = workbook.createFont();
		font2.setFontName("宋体");
		font2.setFontHeightInPoints((short) 10);// 设置字体大小
		fontStyle2.setFont(font2);
		fontStyle2.setBorderBottom(XSSFCellStyle.BORDER_THIN); // 下边框
		fontStyle2.setBorderLeft(XSSFCellStyle.BORDER_THIN);// 左边框
		fontStyle2.setBorderTop(XSSFCellStyle.BORDER_THIN);// 上边框
		fontStyle2.setBorderRight(XSSFCellStyle.BORDER_THIN);// 右边框
		fontStyle2.setAlignment(XSSFCellStyle.ALIGN_CENTER); // 居中
		XssfExcel.fontStyle2 = fontStyle2;
	}

	/**
	 * 根据ExcelMapping 生成列头（多行列头）
	 * 
	 * @param sheet
	 *            工作簿
	 * @param map
	 *            每行每个单元格对应的列头信息
	 */
	public static final void createTableHeader(XSSFSheet sheet,
			Map<Integer, List<ExcelMapping>> map) {
		int rowIndex = 0;
		for (Map.Entry<Integer, List<ExcelMapping>> entry : map.entrySet()) {
			int startIndex = 0;// cell起始位置
			int endIndex = 0;// cell终止位置
			XSSFRow row = sheet.createRow(entry.getKey());
			List<ExcelMapping> excels = entry.getValue();
			for (int x = 0; x < excels.size(); x++) {
				// 合并单元格
				if (excels.get(x).getCols() > 1) {
					if (x == 0) {
						endIndex += excels.get(x).getCols() - 1;
						CellRangeAddress range = new CellRangeAddress(rowIndex,
								rowIndex, startIndex, endIndex);
						sheet.addMergedRegion(range);
						startIndex += excels.get(x).getCols();
					} else {
						endIndex += excels.get(x).getCols() - 1;
						CellRangeAddress range = new CellRangeAddress(rowIndex,
								rowIndex, startIndex, endIndex);
						sheet.addMergedRegion(range);
						startIndex += excels.get(x).getCols();
					}
					XSSFCell cell = row.createCell(startIndex
							- excels.get(x).getCols());
					cell.setCellValue(excels.get(x).getHeadTextName());// 设置内容
					if (excels.get(x).getCellStyle() != null) {
						cell.setCellStyle(excels.get(x).getCellStyle());// 设置格式
					} else {
						cell.setCellStyle(fontStyle);
					}
				} else {
					XSSFCell cell = row.createCell(x);
					cell.setCellValue(excels.get(x).getHeadTextName());// 设置内容
					if (excels.get(x).getCellStyle() != null) {
						cell.setCellStyle(excels.get(x).getCellStyle());// 设置格式
					} else {
						cell.setCellStyle(fontStyle);
					}
				}
				startIndex += 1;
				endIndex += 1;

			}
			rowIndex++;
		}
	}

	/**
	 * 
	 * @param sheet
	 * @param map
	 * @param objs
	 * @param clazz
	 */
	@SuppressWarnings("rawtypes")
	public static void createTableRows(XSSFSheet sheet,
			Map<Integer, List<ExcelMapping>> map, List objs, Class clazz)
			throws IllegalArgumentException, IllegalAccessException,
			InvocationTargetException, IntrospectionException,
			ClassNotFoundException, ParseException {

		// Class clazz = Class.forName(classBeanURL);
		int rowindex = map.size();
		int maxKey = 0;
		List<ExcelMapping> ems = new ArrayList<>();
		for (Map.Entry<Integer, List<ExcelMapping>> entry : map.entrySet()) {
			if (entry.getKey() > maxKey) {
				maxKey = entry.getKey();
			}
		}
		ems = map.get(maxKey);

		List<Integer> widths = new ArrayList<Integer>(ems.size());
		for (Object obj : objs) {
			XSSFRow row = sheet.createRow(rowindex);
			for (int i = 0; i < ems.size(); i++) {
				ExcelMapping em = (ExcelMapping) ems.get(i);
				// 获得get方法
				PropertyDescriptor pd = new PropertyDescriptor(
						em.getPropertyName(), clazz);
				Method getMethod = pd.getReadMethod();
				Object rtn = getMethod.invoke(obj);
				String value = "";
				// 如果是日期类型 进行 转换
				if (rtn != null) {
					if (rtn instanceof Date) {
						// value = DateUtils.formatFullDate((Date) rtn);
					} else {
						value = rtn.toString();
					}
				}
				XSSFCell cell = row.createCell(i);
				if (null != fontStyle2) {
					cell.setCellStyle(fontStyle2);
				}
				cell.setCellValue(value);
				cell.setCellType(XSSFCell.CELL_TYPE_STRING);
				// 获得最大列宽
				int width = value.getBytes().length * 300;
				// 还未设置，设置当前
				if (widths.size() <= i) {
					widths.add(width);
					continue;
				}
				// 比原来大，更新数据
				if (width > widths.get(i)) {
					widths.set(i, width);
				}
			}
			rowindex++;
		}
		// 设置列宽
		for (int index = 0; index < widths.size(); index++) {
			Integer width = widths.get(index);
			width = width < 2500 ? 2500 : width + 300;
			width = width > 10000 ? 10000 + 300 : width + 300;
			sheet.setColumnWidth(index, width);
		}
	}
}
