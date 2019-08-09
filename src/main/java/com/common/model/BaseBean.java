package com.common.model;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Map;


public class BaseBean implements Cloneable {
	
//	@Transient
	protected Map<Object, Object> translation;
	
	@Override
	public Object clone() throws CloneNotSupportedException {
		return  super.clone();
	}

	protected void propertyToString(StringBuilder sb, Field f) throws Exception {
		sb.append(f.getName()).append("=").append(f.get(this));
	}

	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		try {
			boolean isFirst = true;
			sb.append(getClass().getSimpleName()).append("@")
					.append(Integer.toHexString(hashCode())).append(":{");
			Class<?> cls = getClass();
			while (cls != null) {
				Field[] fs = cls.getDeclaredFields();
				for (Field f : fs) {
					if (!Modifier.isStatic(f.getModifiers())) {
						if (!isFirst) {
							sb.append(",");
						}
						f.setAccessible(true);
						this.propertyToString(sb, f);
						isFirst = false;
					}
				}
				cls = cls.getSuperclass();
			}
			sb.append("}");
		} catch (Exception e) {
			e.printStackTrace();
			return super.toString();
		}

		return sb.toString();
	}

	public Map<Object, Object> getTranslation() {
		return translation;
	}

	public void setTranslation(Map<Object, Object> translation) {
		this.translation = translation;
	}

}
