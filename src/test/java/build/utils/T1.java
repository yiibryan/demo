package build.utils;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;

public class T1
{

	public static void main(String[] args) throws ParseException, IOException
	{
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
//		
////		SimpleDateFormat utcFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.000Z");
//		String str = "2018-02-22 02:34:44";
//		Date parse = sdf.parse(str);
//		System.out.println(parse);
		
		File file2 = new File("C:\\Users\\Administrator\\Desktop\\excel\\"  + "22.xls");
		if(!file2.exists())
		{
			file2.createNewFile();
		}
	}
}
