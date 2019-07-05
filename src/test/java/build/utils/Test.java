package build.utils;

import build.dao.BaseDao;
import build.dao.DataBase;
import build.model.FieldModelBean;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


public class Test {

	private static void fac(String modelName,String tableName){
		//String modelName="InOutRecord";
		String basePackage="com.guojiu.financing.flow";
		//String tableName="t_warehouse_in_out_record";
		String outPath = "G:\\192.168.10.239\\国久大数据\\项目工程\\2019年度\\高投融资平台\\项目代码\\后端\\financing\\src\\main\\java\\";

		DataBase dataBase = new DataBase();
		dataBase.setUserName("root");
		dataBase.setPassWord("#20as3SElksds0ew98");
		dataBase.setPath("jdbc:mysql://192.168.10.239:13307/financing?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=false");
//		dataBase.setPassWord("");
//		dataBase.setPath("jdbc:mysql://127.0.0.1:3306/wssp?useUnicode=true&characterEncoding=utf-8");
		dataBase.setDriverName("com.mysql.cj.jdbc.Driver");;
		BaseDao baseDao = new BaseDao(dataBase, "");
		try {

			List<FieldModelBean> fields = baseDao.getColumns(tableName);

			FieldModelBean id = baseDao.getPrimaryKeys(tableName);

			FileUtil fileUtil = new FileUtil(modelName, basePackage, outPath);
			fileUtil.create(tableName, fields,id);

			java.awt.Desktop.getDesktop().open(new File(outPath));

		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			baseDao.close();
		}
	}

	public static   void main(String[] args) {
		List<String> modelNames = new ArrayList<>();
//		modelNames.add("FlowBase");
		modelNames.add("FlowHistory");
//		modelNames.add("FlowNode");
//		modelNames.add("FlowReviewer");
//		modelNames.add("Payment");
//		modelNames.add("SysUser");
//		modelNames.add("Total");

		List<String> tabales = new ArrayList<>();
//		tabales.add("t_flow_base");
		tabales.add("t_flow_history");
//		tabales.add("t_flow_node");
//		tabales.add("t_flow_reviewer");
//		tabales.add("t_finance_payment");
//		tabales.add("t_sys_user");
//		tabales.add("t_statistical_total");


		for(int i=0;i<modelNames.size();i++){
			fac(modelNames.get(i),tabales.get(i));
		}

	}


}

