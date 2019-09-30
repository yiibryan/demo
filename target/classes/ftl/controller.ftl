package ${packageName};

import java.util.List;

import javax.annotation.Resource;

import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.*;

import com.guojiu.common.util.Page;
import com.guojiu.common.util.StringUtils;
import com.lxxx.common.rest.BaseResponse;
import com.lxxx.common.rest.DataResponse;
import com.lxxx.common.rest.PageResponse;
import com.guojiu.common.base.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ${modelPackage}.${modelName};
import ${servicePackage}.${modelName}Service;

@Controller
@RequestMapping("${modelName?uncap_first}")
public class ${modelName}Controller extends BaseController{

	private Logger logger = LoggerFactory.getLogger(${modelName}Controller.class);
	
	@Resource
	private ${modelName}Service ${modelName?uncap_first}Service;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	@ResponseBody
	public PageResponse<List<${modelName}>> list(${modelName} ${modelName?uncap_first}){
		Page.startPage();

		PageResponse<List<${modelName}>> data = ${modelName?uncap_first}Service.find(${modelName?uncap_first});

		return data;
	}
	
	@RequestMapping(value = "{businessId}", method = RequestMethod.GET)
	@ResponseBody
	public BaseResponse detail(@PathVariable("businessId")Integer businessId){

		BaseResponse detail = ${modelName?uncap_first}Service.findOne(businessId);

		return detail;
	}


	@RequestMapping(method = RequestMethod.POST)
	@ResponseBody
	public BaseResponse save(@RequestBody ${modelName} ${modelName?uncap_first}){

		BaseResponse response = ${modelName?uncap_first}Service.save(${modelName?uncap_first});

		return response;
	}

	@RequestMapping(value = "{businessId}", method = RequestMethod.PUT)
	@ResponseBody
	public BaseResponse update(@PathVariable("businessId")Integer businessId,@RequestBody ${modelName} ${modelName?uncap_first}){

		${modelName?uncap_first}.setId(businessId);

		BaseResponse response = ${modelName?uncap_first}Service.update(${modelName?uncap_first});

		return response;
	}


	@RequestMapping(value = "{businessId}", method = RequestMethod.DELETE)
	@ResponseBody
	public BaseResponse update(@PathVariable("businessId")Integer businessId){

		${modelName} ${modelName?uncap_first} = new ${modelName}();
		${modelName?uncap_first}.setId(businessId);

		BaseResponse response = ${modelName?uncap_first}Service.delete(${modelName?uncap_first});

		return response;
	}


	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public BaseResponse delete(@RequestBody Integer[] ids){
		BaseResponse response ;
		
		if(ids!=null && ids.length >0){
			${modelName} ${modelName?uncap_first} = new ${modelName}();
			${modelName?uncap_first}.setIds(Arrays.asList(ids));
			response = ${modelName?uncap_first}Service.delete(${modelName?uncap_first});
		}else{
			response = new BaseResponse(false,"302","没有传id");
		}
		return response;
	}


}