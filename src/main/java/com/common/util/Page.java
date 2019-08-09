package com.common.util;

import com.common.rest.PaginationContext;
import com.github.pagehelper.PageHelper;

/**
 * 分页
 * @author lxxx
 *
 */
public class Page {
	/**
	 * 开启分页
	 */
	public static void startPage(){
		PageHelper.startPage(PaginationContext.getPageNum(), PaginationContext.getPageSize());
	}

}
