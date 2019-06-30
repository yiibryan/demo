package build.model;

import build.model.base.Base;

import java.util.List;


public class ClassModelBean extends Base {

	private FieldModelBean id;
	private String packageName;//包名
	private String className;//类名
	private List<FieldModelBean> fields;//字段
	private String superClassName;//父类
	private String modelName;
	private String modelPackage;
	private String servicePackage;
	private String daoPackage;
	private List<MethodModelBean> methods;//方法列表



	public FieldModelBean getId() {
		return id;
	}
	public void setId(FieldModelBean id) {
		this.id = id;
	}
	public String getServicePackage() {
		return servicePackage;
	}
	public void setServicePackage(String servicePackage) {
		this.servicePackage = servicePackage;
	}
	public String getDaoPackage() {
		return daoPackage;
	}
	public void setDaoPackage(String daoPackage) {
		this.daoPackage = daoPackage;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public String getModelPackage() {
		return modelPackage;
	}
	public void setModelPackage(String modelPackage) {
		this.modelPackage = modelPackage;
	}
	public List<MethodModelBean> getMethods() {
		return methods;
	}
	public void setMethods(List<MethodModelBean> methods) {
		this.methods = methods;
	}
	public String getSuperClassName() {
		return superClassName;
	}
	public void setSuperClassName(String superClassName) {
		this.superClassName = superClassName;
	}
	public String getPackageName() {
		return packageName;
	}
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public List<FieldModelBean> getFields() {
		return fields;
	}
	public void setFields(List<FieldModelBean> fields) {
		this.fields = fields;
	}

}
