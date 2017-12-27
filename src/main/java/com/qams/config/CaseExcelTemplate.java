package com.qams.config;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Workbook;

import com.qams.bean.CaseExcelBean;
import com.qams.bean.ExcelMapping;
import com.qams.domain.Case;
import com.qams.util.XssfExcel;

public class CaseExcelTemplate {
	public static boolean exportCaseByExcel(String path, String sheetName,
			CaseExcelBean excel) {
		List<ExcelMapping> projectName = new ArrayList<>();
		List<ExcelMapping> exportUser = new ArrayList<>();
		List<ExcelMapping> exportCaseNum = new ArrayList<>();
		List<ExcelMapping> exportTime = new ArrayList<>();
		List<ExcelMapping> cellHeader = new ArrayList<>();
		Map<Integer, List<ExcelMapping>> map = new LinkedHashMap<>();
		projectName.add(new ExcelMapping("项目名", null, 1));
		projectName
				.add(new ExcelMapping(excel.getHeaderProjectName(), null, 7));
		exportUser.add(new ExcelMapping("导出者", null, 1));
		exportUser.add(new ExcelMapping(excel.getExportUser(), null, 7));
		exportCaseNum.add(new ExcelMapping("导出用例数", null, 1));
		exportCaseNum.add(new ExcelMapping(excel.getExportCaseNum(), null, 7));
		exportTime.add(new ExcelMapping("导出时间", null, 1));
		exportTime.add(new ExcelMapping(excel.getTime(), null, 7));
		map.put(0, projectName);
		map.put(1, exportUser);
		map.put(2, exportCaseNum);
		map.put(3, exportTime);
		// 添加列头信息
		cellHeader.add(new ExcelMapping("编号（id）", "id", 1));
		cellHeader.add(new ExcelMapping("用例名（name）", "name", 1));
		cellHeader.add(new ExcelMapping("用例描述（description）", "description", 1));
		cellHeader.add(new ExcelMapping("优先级（level）", "level", 1));
		cellHeader.add(new ExcelMapping("用例步骤（step）", "step", 1));
		cellHeader.add(new ExcelMapping("创建者（creater）", "creater", 1));
		cellHeader.add(new ExcelMapping("创建时间（createtime）", "createtime", 1));
		cellHeader.add(new ExcelMapping("更新时间（updateTime）", "updateTime", 1));
		map.put(4, cellHeader);
		Workbook book;
		try {
			book = XssfExcel.createExcelFile(Case.class, excel.getCss(), map,
					sheetName);
			FileOutputStream out = new FileOutputStream(path);
			book.write(out);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}
}
