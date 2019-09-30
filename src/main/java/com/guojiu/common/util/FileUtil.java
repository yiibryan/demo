package com.guojiu.common.util;

import java.io.File;
import java.io.FileOutputStream;

public class FileUtil {
	public static void uploadFile(byte[] file, String filePath, String fileName) throws Exception {
		File targetFile = new File(filePath);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}

		File file2 = new File(filePath + fileName);
		System.out.println();
		// file2.setWritable(true, false);
		// file2.setReadable(true, false);
		FileOutputStream out = new FileOutputStream(file2);
		out.write(file);
		out.flush();
		out.close();
		if (!System.getProperty("os.name").contains("Windows")) {
			Runtime.getRuntime().exec("chmod 777 -R " + filePath);
			Runtime.getRuntime().exec("chmod 644 -R " + filePath + fileName);
		}
	}
}
