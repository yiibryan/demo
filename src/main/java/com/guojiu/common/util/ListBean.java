package com.guojiu.common.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 下拉列表返回
 * @author lxxx
 *
 */
public class ListBean implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String value;

	private String unit;

	private String pKey;

	private List<ListBean> children = new ArrayList<>();

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getpKey() {
		return pKey;
	}

	public void setpKey(String pKey) {
		this.pKey = pKey;
	}

	public List<ListBean> getChildren() {
		return children;
	}

	public void setChildren(List<ListBean> child) {
		this.children = child;
	}

	@Override
	public String toString() {
		return "ListBean{" +
				"key='" + id + '\'' +
				", value='" + value + '\'' +
				", unit='" + unit + '\'' +
				", pKey='" + pKey + '\'' +
				", sub=" + children +
				'}';
	}
}
