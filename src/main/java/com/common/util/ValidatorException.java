package com.common.util;

public class ValidatorException extends RuntimeException
{

	private static final long serialVersionUID = 1L;

	public ValidatorException()
	{
		super();
	}

	public ValidatorException(String message)
	{
		super(message);
	}

	public ValidatorException(Throwable throwable)
	{
		super(throwable);
	}

	public ValidatorException(String message, Throwable throwable)
	{
		super(message, throwable);
	}
}
