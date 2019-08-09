package com.common.util;


public class ValidateUtils
{
	
	public static boolean isPort(int val)
	{
		return !(val < 1 || val > 65535);
	}

	public static boolean isNullOrTrim(String val)
	{
		return val == null || val.trim().length() == 0;
	}

	public static boolean isNull(Object val)
	{
		return val == null;
	}
	
	public static boolean inRange(int val, int low, int high)
	{
		return !(val < low || val > high);
	}
	
	
	
	public static void validatorIfNullOrTrim(String val, String tip)
	{
		if(isNullOrTrim(val))
		{
			throw new ValidatorException(tip);
		}
	}
	
	public static void validatorIfNullOrTrim(Object[] val, String tip)
	{
		if(val == null || val.length == 0)
		{
			throw new ValidatorException(tip);
		}
	}
	
	public static void validatorIfNull(Object val, String tip)
	{
		if(isNull(val))
		{
			throw new ValidatorException(tip);
		}
	}
	
	public static void validatorIfContainNull(String tip, Object... val)
	{
		for(Object obj : val)
		{
			if(isNull(obj))
			{
				throw new ValidatorException(tip);
			}
		}
	}
	
	public static void validatorIfIsPort(int val, String tip)
	{
		if(!isPort(val))
		{
			throw new ValidatorException(tip);
		}
	}

	public static void validatorIfInRange(int val, int low, int high, String tip)
	{
		if(!inRange(val, low, high))
		{
			throw new ValidatorException(tip);
		}
	}

	public static void validatorIfNum(String num, String tip) throws ValidatorException
	{
		try
		{
			Integer.parseInt(num);
		}
		catch (NumberFormatException e)
		{
			throw new ValidatorException(tip);
		}
	}

}
