package ${packageName};

import java.util.List;

import com.guojiu.base.rest.BaseResponse;
import com.guojiu.base.rest.DataResponse;
import com.guojiu.base.rest.PageResponse;

import ${modelPackage}.${modelName};

public interface ${modelName}Service {

	public PageResponse<List<${modelName}>> find(${modelName} ${modelName?uncap_first});
	public DataResponse<${modelName}> findOne(Integer id);
	public BaseResponse save(${modelName} ${modelName?uncap_first});
	public BaseResponse update(${modelName} ${modelName?uncap_first});
	public BaseResponse delete(${modelName} ${modelName?uncap_first});
	
}
