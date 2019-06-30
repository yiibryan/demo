package build.model;

import java.util.List;

public class MethodModelBean {

	private String name;
	private String resultType;
	private List<FieldModelBean> params;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getResultType() {
		return resultType;
	}
	public void setResultType(String resultType) {
		this.resultType = resultType;
	}
	public List<FieldModelBean> getParams() {
		return params;
	}
	public void setParams(List<FieldModelBean> params) {
		this.params = params;
	}
}
