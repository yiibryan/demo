package build.utils;

import build.dao.BaseDao;
import build.dao.DataBase;
import build.model.FieldModelBean;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


public class Test {

	private static void fac(String modelName,String tableName){
		String basePackage="com.guojiu.tms.web";
		String outPath = "F:\\freemaker\\tms\\";

		DataBase dataBase = new DataBase();
		dataBase.setUserName("root");
//		dataBase.setPassWord("#20as3SElksds0ew98");
//		dataBase.setPath("jdbc:mysql://192.168.10.239:13307/tms?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=false");
		dataBase.setPassWord("root");
		dataBase.setPath("jdbc:mysql://127.0.0.1:3306/tms?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true&useAffectedRows=true&serverTimezone=Asia/Shanghai&autoReconnect=true&useSSL=false");
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
		modelNames.add("User");

		List<String> tabales = new ArrayList<>();
		tabales.add("t_jcqx_user");


		for(int i=0;i<modelNames.size();i++){
			fac(modelNames.get(i),tabales.get(i));
		}

	}


}

