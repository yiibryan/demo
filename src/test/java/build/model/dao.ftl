package ${packageName};

import java.util.List;
import org.springframework.stereotype.Repository;

import ${modelPackage}.${modelName};

@Repository
public interface ${modelName}Mapper {

	public List<${modelName}> find(${modelName} ${modelName?uncap_first});
	public ${modelName} save(${modelName} ${modelName?uncap_first});
	public ${modelName} update(${modelName} ${modelName?uncap_first});
	public void delete(${modelName} ${modelName?uncap_first});
}
