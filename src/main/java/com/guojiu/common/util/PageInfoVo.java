package com.guojiu.common.util;

import com.github.pagehelper.Page;
import java.util.List;

public class PageInfoVo {

   private final Boolean success;
   private int pageNum;
   private int pageSize;
   private int size;
   private int startRow;
   private int endRow;
   private List pageRowKey;
   private long total;
   private int pages;
   private List list;
   private int firstPage;
   private int prePage;
   private int nextPage;
   private int lastPage;
   private boolean isFirstPage;
   private boolean isLastPage;
   private boolean hasPreviousPage;
   private boolean hasNextPage;
   private int navigatePages;
   private int[] navigatepageNums;
   private String nextRowKey;


   public void setList(List list) {
      this.list = list;
   }

   public void setTotal(long total) {
      this.total = total;
      if(this.pageSize > 0) {
         this.pages = (int)(total / (long)this.pageSize + (long)(total % (long)this.pageSize == 0L?0:1));
      } else {
         this.pages = 0;
      }

      this.judgePageBoudary();
   }

   public PageInfoVo() {
      this.success = Boolean.valueOf(true);
      this.isFirstPage = false;
      this.isLastPage = false;
      this.hasPreviousPage = false;
      this.hasNextPage = false;
   }

   public PageInfoVo(List pageList, List pageVoList) {
      this(pageList, 8);
      this.list = pageVoList;
   }

   public PageInfoVo(List pageList, int navigatePages) {
      this.success = Boolean.valueOf(true);
      this.isFirstPage = false;
      this.isLastPage = false;
      this.hasPreviousPage = false;
      this.hasNextPage = false;
      if(pageList instanceof Page) {
         Page page = (Page)pageList;
         this.pageNum = page.getPageNum();
         this.pageSize = page.getPageSize();
         this.total = page.getTotal();
         this.pages = page.getPages();
         this.size = page.size();
         if(this.size == 0) {
            this.startRow = 0;
            this.endRow = 0;
         } else {
            this.startRow = page.getStartRow() + 1;
            this.endRow = this.startRow - 1 + this.size;
         }

         this.navigatePages = navigatePages;
         this.calcNavigatepageNums();
         this.calcPage();
         this.judgePageBoudary();
      }

   }

   private void calcNavigatepageNums() {
      int startNum;
      if(this.pages <= this.navigatePages) {
         this.navigatepageNums = new int[this.pages];

         for(startNum = 0; startNum < this.pages; ++startNum) {
            this.navigatepageNums[startNum] = startNum + 1;
         }
      } else {
         this.navigatepageNums = new int[this.navigatePages];
         startNum = this.pageNum - this.navigatePages / 2;
         int endNum = this.pageNum + this.navigatePages / 2;
         int i;
         if(startNum < 1) {
            startNum = 1;

            for(i = 0; i < this.navigatePages; ++i) {
               this.navigatepageNums[i] = startNum++;
            }
         } else if(endNum > this.pages) {
            endNum = this.pages;

            for(i = this.navigatePages - 1; i >= 0; --i) {
               this.navigatepageNums[i] = endNum--;
            }
         } else {
            for(i = 0; i < this.navigatePages; ++i) {
               this.navigatepageNums[i] = startNum++;
            }
         }
      }

   }

   private void calcPage() {
      if(this.navigatepageNums != null && this.navigatepageNums.length > 0) {
         this.firstPage = this.navigatepageNums[0];
         this.lastPage = this.navigatepageNums[this.navigatepageNums.length - 1];
         if(this.pageNum > 1) {
            this.prePage = this.pageNum - 1;
         }

         if(this.pageNum < this.pages) {
            this.nextPage = this.pageNum + 1;
         }
      }

   }

   private void judgePageBoudary() {
      this.isFirstPage = this.pageNum == 1;
      this.isLastPage = this.pageNum == this.pages;
      this.hasPreviousPage = this.pageNum > 1;
      this.hasNextPage = this.pageNum < this.pages;
   }

   public void setPageNum(int pageNum) {
      this.pageNum = pageNum;
   }

   public int getPageNum() {
      return this.pageNum;
   }

   public int getPageSize() {
      return this.pageSize;
   }

   public void setPageSize(int pageSize) {
      this.pageSize = pageSize;
   }

   public int getSize() {
      return this.size;
   }

   public int getStartRow() {
      return this.startRow;
   }

   public int getEndRow() {
      return this.endRow;
   }

   public long getTotal() {
      return this.total;
   }

   public int getPages() {
      return this.pages;
   }

   public List getList() {
      return this.list;
   }

   public int getFirstPage() {
      return this.firstPage;
   }

   public int getPrePage() {
      return this.prePage;
   }

   public int getNextPage() {
      return this.nextPage;
   }

   public int getLastPage() {
      return this.lastPage;
   }

   public boolean isIsFirstPage() {
      return this.isFirstPage;
   }

   public boolean isIsLastPage() {
      return this.isLastPage;
   }

   public boolean isHasPreviousPage() {
      return this.hasPreviousPage;
   }

   public boolean isHasNextPage() {
      return this.hasNextPage;
   }

   public int getNavigatePages() {
      return this.navigatePages;
   }

   public int[] getNavigatepageNums() {
      return this.navigatepageNums;
   }

   public String getNextRowKey() {
      return this.nextRowKey;
   }

   public void setNextRowKey(String nextRowKey) {
      this.nextRowKey = nextRowKey;
   }

   public List getPageRowKey() {
      return this.pageRowKey;
   }

   public void setPageRowKey(List pageRowKey) {
      this.pageRowKey = pageRowKey;
   }

   public String toString() {
      StringBuffer sb = new StringBuffer("PageInfo{");
      sb.append("pageNum=").append(this.pageNum);
      sb.append(", pageSize=").append(this.pageSize);
      sb.append(", size=").append(this.size);
      sb.append(", startRow=").append(this.startRow);
      sb.append(", endRow=").append(this.endRow);
      sb.append(", total=").append(this.total);
      sb.append(", pages=").append(this.pages);
      sb.append(", list=").append(this.list);
      sb.append(", firstPage=").append(this.firstPage);
      sb.append(", prePage=").append(this.prePage);
      sb.append(", nextPage=").append(this.nextPage);
      sb.append(", lastPage=").append(this.lastPage);
      sb.append(", isFirstPage=").append(this.isFirstPage);
      sb.append(", isLastPage=").append(this.isLastPage);
      sb.append(", hasPreviousPage=").append(this.hasPreviousPage);
      sb.append(", hasNextPage=").append(this.hasNextPage);
      sb.append(", navigatePages=").append(this.navigatePages);
      sb.append(", navigatepageNums=");
      if(this.navigatepageNums == null) {
         sb.append("null");
      } else {
         sb.append('[');

         for(int i = 0; i < this.navigatepageNums.length; ++i) {
            sb.append(i == 0?"":", ").append(this.navigatepageNums[i]);
         }

         sb.append(']');
      }

      sb.append('}');
      return sb.toString();
   }

   public Boolean getSuccess() {
      return this.success;
   }
}
