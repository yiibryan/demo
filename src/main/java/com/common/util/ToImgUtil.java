package com.common.util;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

/**
 * 生成缩略图
 */
public class ToImgUtil {

	public static InputStream toSmaillImg(InputStream stream, String formatName, Integer new_w, Integer new_h) throws Exception{
        java.awt.Image bigJpg = ImageIO.read(stream);
        
        if(new_w == null && new_h == null){
        	new_w=new_h=64;
        }
        
		java.awt.image.BufferedImage tag = new java.awt.image.BufferedImage(new_w,new_h,java.awt.image.BufferedImage.TYPE_INT_RGB);
        tag.getGraphics().drawImage(bigJpg,0,0,new_w,new_h,null);
		
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ImageOutputStream imageOutput = ImageIO.createImageOutputStream(byteArrayOutputStream);
        ImageIO.write(tag, formatName, imageOutput);
        InputStream inputStream = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
        
        return inputStream;
    }
}
