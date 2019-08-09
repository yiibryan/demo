package com.common.error;

public enum ResultEnum {
	SUCCESS ("200","操作成功"),
	INSERT_SUCCESS ("201","添加成功"),
	UPDATE_SUCCESS ("202","修改成功"),
	DELETE_SUCCESS ("203","删除成功"),
	SELECT_SUCCESS ("204","查询成功"),
	UPLOAD_SUCCESS ("205","上传成功"),
	REJECT_SUCCESS("206","驳回成功"),
	PASS_SUCCESS("207","通过成功"),
	COMMIT_SUCCESS("208","提交成功"),
	
	FAIL ("300","操作失败"),
	INSERT_FAIL ("301","添加失败"),
	UPDATE_FAIL ("302","修改失败"),
	DELETE_FAIL ("303","删除失败"),
	SELECT_FAIL ("304","查询失败"),
	UPLOAD_FAIL ("305","上传失败"),
	REJECT_FAIL("306","驳回失败"),
	PASS_FAIL("307","通过失败"),
	COMMIT_FAIL("308","提交失败"),

	E400 ("400","文件异常"),
	
	ERROR ("500","服务器错误");
	
	private String code;
	
	private String msg;

	private ResultEnum(String code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	public String getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}
}
