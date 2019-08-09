package com.common.rest;

/**
 * 分页属性 页面传入<br>
 * ·pageNum 页码<br>
 * ·tpageSize 每页记录条数
 * @author lxxx
 */
public class PaginationContext {
	// 定义两个threadLocal变量：pageNum和pageSize
    private static ThreadLocal<Integer> pageNum = new ThreadLocal<Integer>();    // 保存第几页
    private static ThreadLocal<Integer> pageSize = new ThreadLocal<Integer>();    // 保存每页记录条数
    private static ThreadLocal<Integer> totalRecords = new ThreadLocal<Integer>();    // 保存第几页
    private static ThreadLocal<Integer> totalPages = new ThreadLocal<Integer>();    // 保存每页记录条数

    /*
     * pageNum ：get、set、remove
     */
    public static int getPageNum() {
        Integer pn = pageNum.get();
        if (pn == null) {
            return 0;
        }
        return pn;
    }

    public static void setPageNum(int pageNumValue) {
        pageNum.set(pageNumValue);
    }

    public static void removePageNum() {
        pageNum.remove();
    }

    /*
     * pageSize ：get、set、remove
     */
    public static int getPageSize() {
        Integer ps = pageSize.get();
        if (ps == null) {
            return 0;
        }
        return ps;
    }

    public static void setPageSize(int pageSizeValue) {
        pageSize.set(pageSizeValue);
    }

    public static void removePageSize() {
        pageSize.remove();
    }
    
    /*
     * totalRecords ：get、set、remove
     */
    public static int getTotalRecords() {
        Integer tr = totalRecords.get();
        if (tr == null) {
            return 0;
        }
        return tr;
    }

    public static void setTotalRecords(int totalRecordsValue) {
    	totalRecords.set(totalRecordsValue);
    }

    public static void removeTotalRecords() {
    	totalRecords.remove();
    }
    
    /*
     * totalPages ：get、set、remove
     */
    public static int getTotalPages() {
        Integer tp = totalPages.get();
        if (tp == null) {
            return 0;
        }
        return tp;
    }

    public static void setTotalPages(int totalPagesValue) {
    	totalPages.set(totalPagesValue);
    }

    public static void removeTotalPages() {
    	totalPages.remove();
    }
}
