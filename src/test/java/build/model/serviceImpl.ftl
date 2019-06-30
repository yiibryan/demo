package ${packageName};

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.guojiu.intellinpark.manage.common.util.StringUtils;
import com.guojiu.intellinpark.manage.common.error.ResultEnum;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.guojiu.intellinpark.manage.common.rest.Response;
import ${daoPackage}.${modelName}Mapper;
import ${modelPackage}.${modelName};
import ${servicePackage}.${modelName}Service;

@Service
public class ${modelName}ServiceImpl implements ${modelName}Service {

	@Resource
	private ${modelName}Mapper ${modelName?uncap_first}Mapper;
	
	@Override
	public Response<List<${modelName}>> find(${modelName} ${modelName?uncap_first}) {
		// TODO Auto-generated method stub
		List<${modelName}> list = ${modelName?uncap_first}Mapper.find(${modelName?uncap_first});


		Response<List<${modelName}>> resultBean = new Response<List<${modelName}>>(true,ResultEnum.SELECT_SUCCESS,list);

		return resultBean;
	}

	public ${modelName} findOne(${modelName} ${modelName?uncap_first}){
		List<${modelName}> list = this.find(${modelName?uncap_first}).getData();
		if(list!=null && list.size()>0){
			${modelName?uncap_first} = list.get(0);
		}
	
		return ${modelName?uncap_first};
	}
	
	
	@Override
	public Response<${modelName}> save(${modelName} ${modelName?uncap_first}) {
		// TODO Auto-generated method stub
		Response<${modelName}> response = new Response();
		try {
			${modelName?uncap_first}.setId(StringUtils.createUUID());
			${modelName?uncap_first}Mapper.save(${modelName?uncap_first});
			response=new Response<${modelName}>(true,ResultEnum.INSERT_SUCCESS);
		} catch (Exception e) {
			// TODO: handle exception
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			response=new Response<${modelName}>(false,ResultEnum.INSERT_FAIL);
			e.printStackTrace();
		}
		
		return response;
	}

	@Override
	public Response<${modelName}> update(${modelName} ${modelName?uncap_first}) {
		// TODO Auto-generated method stub
		Response<${modelName}> response = new Response();
		try {
			${modelName?uncap_first}Mapper.update(${modelName?uncap_first});
			response=new Response<${modelName}>(true,ResultEnum.UPDATE_SUCCESS);
		} catch (Exception e) {
			// TODO: handle exception
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			response=new Response<${modelName}>(false,ResultEnum.UPDATE_FAIL);
			e.printStackTrace();
		}
		
		return response;
	}
	
	@Override
	public Response<${modelName}> delete(${modelName} ${modelName?uncap_first}) {
		// TODO Auto-generated method stub
		Response<${modelName}> response = new Response();
		try {
			${modelName?uncap_first}Mapper.delete(${modelName?uncap_first});
			response=new Response<${modelName}>(true,ResultEnum.DELETE_SUCCESS);
    	} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
    		response=new Response<${modelName}>(false,ResultEnum.DELETE_FAIL);
		}
		
		return response;
	}
}
