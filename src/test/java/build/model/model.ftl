package ${packageName};

import java.math.BigDecimal;
import java.util.List;
import java.util.Date;
<#if superClassName??>
</#if>
/**
 *  自动生成model
 */
public class ${className} <#if superClassName??>extend ${superClassName}</#if>{
    <#list fields as attr> 
    //${attr.remark}
    private ${attr.fieldType} ${attr.fieldName};
    </#list>
    private List<String> ids;

    <#list fields as attr>
    public void set${attr.fieldName?cap_first}(${attr.fieldType} ${attr.fieldName}){
        this.${attr.fieldName} = ${attr.fieldName};
    }
    public ${attr.fieldType} get${attr.fieldName?cap_first}(){
        return this.${attr.fieldName};
    }
    </#list>
    public List<String> getIds() {
		return ids;
	}
	public void setIds(List<String> ids) {
		this.ids = ids;
	}
	
}

//┏┓　　　┏┓  
//┏┛┻━━━┛┻┓  
//┃　　　　　　　┃  
//┃　　　━　　　┃  
//┃　┳┛　┗┳　┃  
//┃　　　　　　　┃  
//┃　　　┻　　　┃  
//┃　　　　　　　┃  
//┗━┓　　　┏━┛  
//	  ┃　　　┃   神兽保佑  
//	  ┃　　　┃   代码无BUG！  
//	  ┃　　　┗━━━┓  
//	  ┃　　　　　　　┣┓  
//	  ┃　　　　　　　┏┛  
//	  ┗┓┓┏━┳┓┏┛  
// 	      ┃┫┫　┃┫┫  
// 	      ┗┻┛　┗┻┛  