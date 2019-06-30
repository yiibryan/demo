package ${packageName};

import java.util.List;

import com.guojiu.intellinpark.manage.common.rest.Response;

import ${modelPackage}.${modelName};

public interface ${modelName}Service {

	public Response<List<${modelName}>> find(${modelName} ${modelName?uncap_first});
	public ${modelName} findOne(${modelName} ${modelName?uncap_first});
	public Response<${modelName}> save(${modelName} ${modelName?uncap_first});
	public Response<${modelName}> update(${modelName} ${modelName?uncap_first});
	public Response<${modelName}> delete(${modelName} ${modelName?uncap_first});
	
}
