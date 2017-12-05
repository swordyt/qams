package com.qams.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;

public class FileUtil {
	public static String getMd5ByFile(File file) throws FileNotFoundException {
		FileInputStream in = new FileInputStream(file);
		return getMd5ByFile(in, file.length());
	}

	public static String getMd5ByFile(FileInputStream in, long size)
			throws FileNotFoundException {
		String value = null;
		try {
			MappedByteBuffer byteBuffer = in.getChannel().map(
					FileChannel.MapMode.READ_ONLY, 0, size);
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			md5.update(byteBuffer);
			BigInteger bi = new BigInteger(1, md5.digest());
			value = bi.toString(16);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return value;
	}

	/**
	 * 返回文件后缀
	 * */
	public static String getFileSuffix(String originalFilename) {
		String[] nameSplit = originalFilename.split("\\.");
		return nameSplit[nameSplit.length - 1];
	}
}
