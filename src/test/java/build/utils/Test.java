package build.utils;

import build.dao.BaseDao;
import build.dao.DataBase;
import build.model.FieldModelBean;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


public class Test {

    private static void fac(String modelName, String tableName) {
        //String modelName="InOutRecord";
        String basePackage = "com.gjbigdata.realtysale.crm";
        //String tableName="t_warehouse_in_out_record";
        String outPath = "E:\\freemaker\\realtysale\\";

        DataBase dataBase = new DataBase();
        dataBase.setUserName("root");
//		dataBase.setPassWord("#20as3SElksds0ew98");
//		dataBase.setPath("jdbc:mysql://192.168.10.239:13307/houses?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true");
//		dataBase.setPassWord("123456");
        dataBase.setPath("jdbc:mysql://127.0.0.1:3306/house?useUnicode=true&characterEncoding=utf-8");
        dataBase.setDriverName("com.mysql.cj.jdbc.Driver");
        ;
        BaseDao baseDao = new BaseDao(dataBase, "");
        try {

            List<FieldModelBean> fields = baseDao.getColumns(tableName);

            FieldModelBean id = baseDao.getPrimaryKeys(tableName);

            FileUtil fileUtil = new FileUtil(modelName, basePackage, outPath);
            fileUtil.create(tableName, fields, id);

            java.awt.Desktop.getDesktop().open(new File(outPath));

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            baseDao.close();
        }
    }

    public static void main(String[] args) {
        List<String> modelNames = new ArrayList<>();
        modelNames.add("Message");

        List<String> tables = new ArrayList<>();
        tables.add("t_crm_msg");

        for (int i = 0; i < modelNames.size(); i++) {
            fac(modelNames.get(i), tables.get(i));
        }

    }


}

