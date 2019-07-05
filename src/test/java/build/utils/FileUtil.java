package build.utils;

import build.model.ClassModelBean;
import build.model.FieldModelBean;
import build.model.MapperModelBean;
import build.model.base.Base;
import com.lxxx.common.dto.BaseBean;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

import java.io.*;
import java.util.List;

public class FileUtil {
	private final static String TEMPLATE_BASE_URI="/ftl/";

	private String modelName;
	private String basePackage;
	private String filePath;
	private String requestPrefix="";

	
	
	public FileUtil(String modelName, String basePackage,String filePath) {
		super();
		this.modelName = modelName;
		this.basePackage = basePackage+"."+modelName.toLowerCase();
		this.filePath = filePath+"/";
	}
	
	public void create(String tableName, List<FieldModelBean> fields, FieldModelBean id){
		try {
			creadMapper(tableName, fields,id);
	        createModel(fields);
	        createDao();
	        createService();
	        createServiceImpl();
	        createController();
	       // createQueryJsp(fields,id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	//创建查询页面文件
	public void createQueryJsp(List<FieldModelBean> fields, FieldModelBean id){
		ClassModelBean root = new ClassModelBean();
		root.setModelName(modelName);
		root.setFields(fields);
		root.setId(id);
		
		try {
			create("list.ftl",root,"list.jsp",filePath+(basePackage).replace(".", "/"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//创建mapper文件
	public void creadMapper(String tableName, List<FieldModelBean> fields, FieldModelBean id){
		MapperModelBean root = new MapperModelBean();

		root.setId(id);
		root.setNameSpace(basePackage+".mapper."+modelName+"Mapper");
		root.setType(basePackage+".domain."+modelName);
		root.setTableName(tableName);
       
		root.setFields(fields);
		try {
			create("mapper.ftl",root,modelName+"Mapper.xml",filePath+(basePackage+".mapper").replace(".", "/"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void createModel(List<FieldModelBean> fields) throws IOException, TemplateException{
		ClassModelBean root = new ClassModelBean();
		root.setClassName(modelName);
		root.setPackageName(basePackage+".domain");
       	root.setFields(fields);
       	root.setSuperClassName(BaseBean.class.getName());
		root.setSuperClass("BaseBean");
       	
       	create("model.ftl",root,modelName+".java",filePath+root.getPackageName().replace(".", "/"));
	}
	
	public void createService() throws IOException, TemplateException{
		ClassModelBean root = new ClassModelBean();
		root.setClassName(modelName+"Service");
		root.setPackageName(basePackage+".service");   
		root.setModelPackage(basePackage+".domain");
		root.setModelName(modelName);
		
       	create("service.ftl",root,modelName+"Service.java",filePath+root.getPackageName().replace(".", "/"));
	}
	
	public void createServiceImpl() throws IOException, TemplateException{
		ClassModelBean root = new ClassModelBean();
		root.setClassName(modelName+"ServiceImpl");
		root.setPackageName(basePackage+".service.impl");     
		root.setServicePackage(basePackage+".service");
		root.setDaoPackage(basePackage+".mapper");
		root.setModelPackage(basePackage+".domain");
		root.setModelName(modelName);
		
       	create("serviceImpl.ftl",root,modelName+"ServiceImpl.java",filePath+root.getPackageName().replace(".", "/"));
	}
	
	public void createDao() throws IOException, TemplateException{
		ClassModelBean root = new ClassModelBean();
		root.setClassName(modelName+"Mapper");
		root.setPackageName(basePackage+".mapper");
		
		root.setModelPackage(basePackage+".domain");
		root.setModelName(modelName);
		
       	create("dao.ftl",root,modelName+"Mapper.java",filePath+root.getPackageName().replace(".", "/"));
	}
	public void createController() throws IOException, TemplateException{
		ClassModelBean root = new ClassModelBean();
		root.setClassName(modelName+"Controller");
		root.setPackageName(basePackage+".controller");   
		
		root.setServicePackage(basePackage+".service");
		root.setModelPackage(basePackage+".domain");
		root.setModelName(modelName);
		
       	create("controller.ftl",root,modelName+"Controller.java",filePath+root.getPackageName().replace(".", "/"));
	}
	
	
	 public void create(String templateName, Base root, String fileName, String outPath) throws IOException, TemplateException{
		 Configuration cfg = new Configuration();
		 cfg.setClassForTemplateLoading(this.getClass(), TEMPLATE_BASE_URI);   
		 cfg.setDefaultEncoding("UTF-8");
		 cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
        
		 Template temp = cfg.getTemplate(templateName);  // load E:/Work/Freemarker/templates/person.ftl
		 
		 File dir = new File(outPath);
		 if(!dir.exists()){
			 dir.mkdirs();
		 }
		 OutputStream fos = new  FileOutputStream( new File(dir, fileName)); //java文件的生成目录   
		 Writer out = new OutputStreamWriter(fos);
		 temp.process(root, out);
		 
		 fos.flush();  
		 fos.close();

		 System.out.println("gen code success!");
	 }

}
