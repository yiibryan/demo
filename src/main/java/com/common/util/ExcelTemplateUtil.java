package com.common.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.poi.hssf.usermodel.DVConstraint;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDataValidation;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Name;
import org.apache.poi.ss.util.CellRangeAddressList;

public class ExcelTemplateUtil {
	private static ExcelTemplateUtil ourInstance = new ExcelTemplateUtil();

	public static ExcelTemplateUtil getInstance() {
		return ourInstance;
	}

	private ExcelTemplateUtil() {
	}

	// public HSSFWorkbook create(Map<String, List<String>> paraMap) throws
	// IOException {
	// HSSFWorkbook wb = new HSSFWorkbook();// excel文件对象
	// HSSFSheet sheetlist = wb.createSheet("sheet1");// 工作表对象
	// // OutputStream out = new FileOutputStream("d:\\success.xls");
	// ArrayList<String> title = new ArrayList<String>();
	// // for (Entry<String, List<String>> temp : paraMap.entrySet()) {
	// // title.add(temp.getKey());
	// // if (!ToolKit.isEmpty(temp.getValue())) {
	// // setHSSFValidation(sheetlist, temp.getValue().toArray(new
	// // String[temp.getValue().size()]), 1, 5000,
	// // title.size(), title.size());
	// // }
	// // }
	//
	// // String[] textlist = { "列表1", "列表2", "列表3", "列表4", "列表5" };
	// // String[] textlist2 = { "列表a", "列表b", "列表c", "列表d", "列表e" };
	//
	// // sheetlist = setHSSFValidation(sheetlist, textlist, 1, 5000, 0, 0);//
	// // 第一列的前0-5000行都设置为选择列表形式.
	// // sheetlist = setHSSFValidation(sheetlist, textlist2, 1, 5000, 1, 1);//
	// // 第一列的前501行都设置为选择列表形式.
	// // sheetlist = setHSSFPrompt(sheetlist, "promt Title", "prompt Content",
	// // 1, 500, 1, 1);// 第二列的前501行都设置提示.
	//
	// HSSFRow row = sheetlist.createRow(0);// 创建行
	// for (int i = 0; i < title.size(); i++) {
	// HSSFCell cell = row.createCell(i);// 创建单元格
	// cell.setCellValue(title.get(i));
	// }
	//
	// // wb.write(out);
	// // out.close();
	// return wb;
	// }

	// public void createFirstRow(HSSFSheet sheet, String[] str) {
	// for (int i = 0; i < str.length; i++) {
	// HSSFRow row = sheet.createRow(0);// 创建行
	// HSSFCell cell = row.createCell(i);// 创建单元格
	// cell.setCellValue("xuhao");
	// }
	// }

	/**
	 * 设置某些列的值只能输入预制的数据,显示下拉框.
	 * 
	 * @param sheet
	 *            要设置的sheet.
	 * @param textlist
	 *            下拉框显示的内容
	 * @param firstRow
	 *            开始行
	 * @param endRow
	 *            结束行
	 * @param firstCol
	 *            开始列
	 * @param endCol
	 *            结束列
	 * @return 设置好的sheet.
	 */
	public HSSFSheet setHSSFValidation(HSSFSheet sheet, String[] textlist, int firstRow, int endRow, int firstCol,
			int endCol) {
		// 加载下拉列表内容
		DVConstraint constraint = DVConstraint.createExplicitListConstraint(textlist);
		// 设置数据有效性加载在哪个单元格上,四个参数分别是：起始行、终止行、起始列、终止列
		CellRangeAddressList regions = new CellRangeAddressList(firstRow, endRow, firstCol, endCol);
		// 数据有效性对象
		HSSFDataValidation data_validation_list = new HSSFDataValidation(regions, constraint);
		sheet.addValidationData(data_validation_list);
		return sheet;
	}

	/**
	 * 设置单元格上提示
	 * 
	 * @param sheet
	 *            要设置的sheet.
	 * @param promptTitle
	 *            标题
	 * @param promptContent
	 *            内容
	 * @param firstRow
	 *            开始行
	 * @param endRow
	 *            结束行
	 * @param firstCol
	 *            开始列
	 * @param endCol
	 *            结束列
	 * @return 设置好的sheet.
	 */
	public HSSFSheet setHSSFPrompt(HSSFSheet sheet, String promptTitle, String promptContent, int firstRow, int endRow,
			int firstCol, int endCol) {
		// 构造constraint对象
		DVConstraint constraint = DVConstraint.createCustomFormulaConstraint("BB1");
		// 四个参数分别是：起始行、终止行、起始列、终止列
		CellRangeAddressList regions = new CellRangeAddressList(firstRow, endRow, firstCol, endCol);
		// 数据有效性对象
		HSSFDataValidation data_validation_view = new HSSFDataValidation(regions, constraint);
		data_validation_view.createPromptBox(promptTitle, promptContent);
		sheet.addValidationData(data_validation_view);
		return sheet;
	}

	public HSSFWorkbook create(Map<String, List<String>> paraMap) {
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet realSheet = workbook.createSheet("sheet1");
		ArrayList<String> title = new ArrayList<String>();
		int count = 0;
		CellStyle css = workbook.createCellStyle();  
        DataFormat format = workbook.createDataFormat();  
        css.setDataFormat(format.getFormat("@"));
		for (Entry<String, List<String>> temp : paraMap.entrySet()) {
			title.add(temp.getKey());
			if (!ToolKit.isEmpty(temp.getValue())) {
				// setHSSFValidation(sheetlist, temp.getValue().toArray(new
				// String[temp.getValue().size()]), 1, 5000,
				// title.size(), title.size());
				String tempName = (temp.getKey()).split("\\|")[0];
				HSSFSheet hidden = workbook.createSheet(tempName);
				HSSFCell cell = null;
				for (int i = 0, length = temp.getValue().size(); i < length; i++) {
					String name = temp.getValue().get(i);
//					CellStyle textStyle = workbook.createCellStyle();
//					DataFormat format = workbook.createDataFormat();  
//					textStyle.setDataFormat(format.getFormat("@"));
					HSSFRow row = hidden.createRow(i);
					cell = row.createCell(0);
					cell.setCellValue(name);
//					cell.setCellStyle(textStyle);
				}
				// CellRangeAddressList regions = new CellRangeAddressList(0, 0,
				// 0, 0);
				// // 获取单元格的坐标
				// System.out.println(regions.getCellRangeAddress(0).formatAsString());

				Name namedCell = workbook.createName();
				namedCell.setNameName(tempName);
				namedCell.setRefersToFormula(
						tempName + "!$A:$A" /* + countryName.length */);
				// 加载数据,将名称为hidden的
				DVConstraint constraint = DVConstraint.createFormulaListConstraint(tempName);

				// 设置数据有效性加载在哪个单元格上,四个参数分别是：起始行、终止行、起始列、终止列
				CellRangeAddressList addressList = new CellRangeAddressList(1, 2000, count, count);
				HSSFDataValidation validation = new HSSFDataValidation(addressList, constraint);

				// 将第二个sheet设置为隐藏
				// workbook.setSheetHidden(1, true);
				realSheet.addValidationData(validation);

			}
			count++;
		}
		// 隐藏字典表
		for (int i = 1; i < workbook.getNumberOfSheets(); i++) {
			workbook.setSheetHidden(i, true);
		}
		HSSFRow row = realSheet.createRow(0);// 创建行
		for (int i = 0; i < title.size(); i++) {
			HSSFCell cell = row.createCell(i);// 创建单元格
			cell.setCellValue(title.get(i));
			realSheet.setDefaultColumnStyle(i, css);//设置为文本类型
			realSheet.autoSizeColumn((short)i,true);//设置自动列宽
		}
		return workbook;

	}
}
