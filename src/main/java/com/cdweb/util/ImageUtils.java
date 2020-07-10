package com.cdweb.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class ImageUtils {
	public static byte[] convert(File file){
		byte[] res = new byte[(int) file.length()];
		try {
		FileInputStream fileInputStream = new FileInputStream(file);
			fileInputStream.read(res);
			fileInputStream.close();
			return res;
		}	catch (FileNotFoundException e) {
			e.printStackTrace();
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static File convert(byte[] bytes, String filePath){
		try {
		File file = new File(filePath);
		FileOutputStream fileOutputStream;
		fileOutputStream = new FileOutputStream(file);
		fileOutputStream.write(bytes);
		fileOutputStream.close();
		return file;
		}	catch (FileNotFoundException e) {
			e.printStackTrace();
		} 
		catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
