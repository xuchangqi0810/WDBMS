package cn.xcq.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
/*
 Excel工具类
 */
public class ExcelUtilTool<T> {

	private Class<T> clazz;

	/**
	 * 将内存中的List集合变成硬盘上Excel文件中的内容
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public File ListToExcel(List<T> list) throws Exception {
		Workbook wb = new HSSFWorkbook();
		// 一个sheet页的名字就是类名
		Sheet sheet = wb.createSheet(clazz.getSimpleName());
		Row titleRow = sheet.createRow(0);
		File file = null;
		CellStyle cellstyle = wb.createCellStyle();

		CreationHelper helper = wb.getCreationHelper();
		// 设置单元格横向纵向对齐方式
		/*cellstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		cellstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);*/

		// 设置日期格式
		cellstyle.setDataFormat(helper.createDataFormat().getFormat(
				"yyyy-MM-dd hh:mm:ss"));
		// 获取类中的所有字段
		Field[] files = clazz.getDeclaredFields();
		for (int i = 0; i < files.length; i++) {
			if (!files[i].getType().getSimpleName().equals("Set")) {
				String name = files[i].getName();
				// 将表中的字段设置为title(标题行)的列名
				titleRow.createCell(i).setCellValue(name);
				for (int j = 0; j < list.size(); j++) {
					Object obj = list.get(j);
					Row row = sheet.createRow(j + 1);
					for (int k = 0; k < files.length; k++) {
						if (!files[k].getType().getSimpleName().equals("Set")) {
							files[k].setAccessible(true);
							String shuju = files[k].get(obj).toString();
							row.createCell(k).setCellValue(shuju);
						}
					}
				}
			}
		}
		file = File.createTempFile("roleInfo", ".xls");
		FileOutputStream fos = new FileOutputStream(file);
		wb.write(fos);
		return file;
	}

	/**
	 * 从Excel文件拽出数据 ，放入泛型 ，泛型在手，数据我有
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public List<T> ExcelToList(File file) throws Exception{
		InputStream is=new FileInputStream(file);
		POIFSFileSystem po1=new POIFSFileSystem(is);
		Workbook wb = new HSSFWorkbook(po1);
		Sheet sheet = wb.getSheetAt(0);
		List<T> list=new ArrayList<T>();
		//获取行数
		int rows=sheet.getPhysicalNumberOfRows();
		Field[] declaredFields = clazz.getDeclaredFields();
		if(rows>1){
			//从第一行获取数据
			for (int i = 1; i < rows; i++) {
				T t = clazz.newInstance();
				Row row = sheet.getRow(i);
				//获取列数
				int cells=row.getPhysicalNumberOfCells();

				for (int j = 0; j < cells; j++) {
					//根据类型获取数据
					Object cellValue = this.getCellValue(row.getCell(j));
					System.out.println(cellValue);

					if(!(declaredFields[j].getType().getSimpleName().equals("Set"))){
						//BeanUtils的copyProperty方法 参数1 为对象 参数2 为对象的字段 参数3为真正的数据
						BeanUtils.copyProperty(t,declaredFields[j].getName() , cellValue);
					}
				}
				list.add(t);
			}
		}
		return list;
	}
	/**
	 * 解析excel表格中的数据 按照类型
	 * @param cell
	 * @return
	 */
	private  Object getCellValue(Cell cell) throws ParseException {
		Object result = null;
		if (cell != null) {
			switch (cell.getCellType()) {
				case Cell.CELL_TYPE_STRING:
					result = cell.getStringCellValue();
					break;
				case Cell.CELL_TYPE_NUMERIC:
					//对日期进行判断和解析
					if(HSSFDateUtil.isCellDateFormatted(cell)){
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        return sdf.format(HSSFDateUtil.getJavaDate(cell.getNumericCellValue()));
					}
					break;
				//对boolean类型的值进行解析
				case Cell.CELL_TYPE_BOOLEAN:
					result = cell.getBooleanCellValue();
					break;
				case Cell.CELL_TYPE_FORMULA:
					result = cell.getCellFormula();
					break;
				case Cell.CELL_TYPE_ERROR:
					result = cell.getErrorCellValue();
					break;
				case Cell.CELL_TYPE_BLANK:
					break;
				default:
					break;
			}
		}
		return result;
	}

	public Class<T> getClazz() {
		return clazz;
	}
	public void setClazz(Class<T> clazz) {
		this.clazz = clazz;
	}


}
