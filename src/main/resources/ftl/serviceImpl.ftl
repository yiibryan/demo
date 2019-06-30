package ${packageName};

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.common.util.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.guojiu.base.rest.BaseResponse;
import com.guojiu.base.rest.DataResponse;
import com.guojiu.base.rest.PageResponse;
import com.guojiu.base.rest.ResultEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import ${daoPackage}.${modelName}Mapper;
import ${modelPackage}.${modelName};
import ${servicePackage}.${modelName}Service;

@Service
public class ${modelName}ServiceImpl implements ${modelName}Service {

	private Logger logger = LoggerFactory.getLogger(${modelName}ServiceImpl.class);

	@Resource
	private ${modelName}Mapper ${modelName?uncap_first}Mapper;
	
	@Override
	public PageResponse<List<${modelName}>> find(${modelName} ${modelName?uncap_first}) {
		// TODO Auto-generated method stub
		List<${modelName}> list = ${modelName?uncap_first}Mapper.find(${modelName?uncap_first});


		PageResponse<List<${modelName}>> resultBean = new PageResponse<List<${modelName}>>(true,ResultEnum.SELECT_SUCCESS,list);

		return resultBean;
	}

	public DataResponse<${modelName}> findOne(Integer id){
		${modelName} ${modelName?uncap_first} = new ${modelName}();

		${modelName?uncap_first}.setId(id);
		${modelName} one = ${modelName?uncap_first}Mapper.findOne(${modelName?uncap_first});
		DataResponse<${modelName}> resultBean = new DataResponse<${modelName}>(true,ResultEnum.SELECT_SUCCESS,one);

		return resultBean;
	}
	
	
	@Override
	@Transactional
	public BaseResponse save(${modelName} ${modelName?uncap_first}) {
		// TODO Auto-generated method stub
		BaseResponse response ;
		try {
			//${modelName?uncap_first}.setId(StringUtils.createUUID());
			${modelName?uncap_first}Mapper.save(${modelName?uncap_first});
			response=new BaseResponse(true,ResultEnum.INSERT_SUCCESS);
		} catch (Exception e) {
			// TODO: handle exception
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			response=new BaseResponse(false,ResultEnum.INSERT_FAIL);
			e.printStackTrace();
		}
		
		return response;
	}

	@Override
	@Transactional
	public BaseResponse update(${modelName} ${modelName?uncap_first}) {
		// TODO Auto-generated method stub
		BaseResponse response;
		try {
			${modelName?uncap_first}Mapper.update(${modelName?uncap_first});
			response=new BaseResponse(true,ResultEnum.UPDATE_SUCCESS);
		} catch (Exception e) {
			// TODO: handle exception
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			response=new BaseResponse(false,ResultEnum.UPDATE_FAIL);
			e.printStackTrace();
		}
		
		return response;
	}
	
	@Override
	@Transactional
	public BaseResponse delete(${modelName} ${modelName?uncap_first}) {
		// TODO Auto-generated method stub
		BaseResponse response;
		try {
			${modelName?uncap_first}Mapper.delete(${modelName?uncap_first});
			response=new BaseResponse(true,ResultEnum.DELETE_SUCCESS);
    	} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			e.printStackTrace();
    		response=new BaseResponse(false,ResultEnum.DELETE_FAIL);
		}
		
		return response;
	}
}
