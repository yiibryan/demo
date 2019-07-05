package build.model;

import build.model.base.Base;

import java.util.List;

public class MapperModelBean extends Base {

	private FieldModelBean id;
	private String nameSpace;
	private String type;
	private String tableName;
	private List<FieldModelBean> fields;
	
	
	
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public FieldModelBean getId() {
		return id;
	}
	public void setId(FieldModelBean id) {
		this.id = id;
	}
	public String getNameSpace() {
		return nameSpace;
	}
	public void setNameSpace(String nameSpace) {
		this.nameSpace = nameSpace;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<FieldModelBean> getFields() {
		return fields;
	}
	public void setFields(List<FieldModelBean> fields) {
		this.fields = fields;
	}
	
	
}
