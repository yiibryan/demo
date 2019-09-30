package com.guojiu.common.util;

import com.github.pagehelper.PageHelper;
import com.guojiu.common.rest.PaginationContext;

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
