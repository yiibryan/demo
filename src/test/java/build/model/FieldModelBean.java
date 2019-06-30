package build.model;

import build.model.base.Base;

public class FieldModelBean  extends Base {

	private String fieldName;
	private String fieldType;
	private String colName;
	private String remark;
	private boolean isPrimaryKey;



//	public FieldModelBean(String fieldName, String fieldType) {
//		super();
//		this.fieldName = fieldName;
//		this.fieldType = fieldType;
//	}

	public FieldModelBean(String fieldName, String fieldType, String colName,String remark, boolean isPrimaryKey) {
		super();
		this.fieldName = fieldName;
		this.fieldType = fieldType;
		this.colName = colName;
		this.remark = remark;
		this.isPrimaryKey = isPrimaryKey;
	}



	public boolean isPrimaryKey() {
		return isPrimaryKey;
	}



	public void setPrimaryKey(boolean isPrimaryKey) {
		this.isPrimaryKey = isPrimaryKey;
	}



	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getColName() {
		return colName;
	}

	public void setColName(String colName) {
		this.colName = colName;
	}

	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}
	public String getFieldType() {
		return fieldType;
	}
	public void setFieldType(String fieldType) {
		this.fieldType = fieldType;
	}


}
