package com.common.aop;

import com.gjbigdata.realtysale.sys.dict.domain.Dict;

import java.util.List;

public interface DataHelperDictService {
    String getDictByKey(String key, String key2);
    List<Dict> getDictByKey(String key);
}
