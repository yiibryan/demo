package ${packageName};

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import ${modelPackage}.${modelName};

@Repository
@Mapper
public interface ${modelName}Mapper {

	public List<${modelName}> find(${modelName} ${modelName?uncap_first});
	public ${modelName} findOne(${modelName} ${modelName?uncap_first});
	public void save(${modelName} ${modelName?uncap_first});
	public void saveList(List<${modelName}> ${modelName?uncap_first}s);
	public void update(${modelName} ${modelName?uncap_first});
	public void delete(${modelName} ${modelName?uncap_first});
}
