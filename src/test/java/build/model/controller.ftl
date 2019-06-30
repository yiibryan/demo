package ${packageName};

import java.util.List;

import javax.annotation.Resource;

import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestBody;

import com.guojiu.intellinpark.manage.common.util.Page;
import com.guojiu.intellinpark.manage.common.util.StringUtils;
import com.guojiu.intellinpark.manage.common.rest.Response;
import ${modelPackage}.${modelName};
import ${servicePackage}.${modelName}Service;

@Controller
@RequestMapping("${modelName?uncap_first}")
public class ${modelName}Controller{

	private final String BASE_DIR="${modelName?uncap_first}";
	
	@Resource
	private ${modelName}Service ${modelName?uncap_first}Service;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	@ResponseBody
	public Response<List<${modelName}>> list(${modelName} ${modelName?uncap_first}){
		Page.startPage();

		Response<List<${modelName}>> data = ${modelName?uncap_first}Service.find(${modelName?uncap_first});

		return data;
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	@ResponseBody
	public ${modelName} detail(${modelName} ${modelName?uncap_first}){
		${modelName} detail = ${modelName?uncap_first}Service.findOne(${modelName?uncap_first});

		return detail;
	}


	@RequestMapping(value = "save", method = RequestMethod.POST)
	@ResponseBody
	public Response<${modelName}> save(@RequestBody ${modelName} ${modelName?uncap_first}){

		Response<${modelName}> response = ${modelName?uncap_first}Service.save(${modelName?uncap_first});

		return response;
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public Response<${modelName}> update(@RequestBody ${modelName} ${modelName?uncap_first}){

		Response<${modelName}> response = ${modelName?uncap_first}Service.update(${modelName?uncap_first});

		return response;
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public Response<${modelName}> delete(@RequestBody String[] ids){
		Response<${modelName}> response = new Response<${modelName}>();
		
		if(StringUtils.isNotBlank(ids)){
			${modelName} ${modelName?uncap_first} = new ${modelName}();
			${modelName?uncap_first}.setIds(Arrays.asList(ids));
			response = ${modelName?uncap_first}Service.delete(${modelName?uncap_first});
		}else{
			response = new Response<${modelName}>(false,"302","没有传id");
		}
		return response;
	}


}