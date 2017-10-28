package red.star;

import java.io.*;

public class Play {
	int imageNumber = 0,max;
	String pictureName[],playImage;
	String webDir="";
	String tomcatDir;
	public Play(){
		File f = new File("");
		String path = f.getAbsolutePath();
		//int index = path.indexOf("bin");
		tomcatDir = path.substring(0);
	}
	public void setWebDir(String s){
		webDir = s;
		if(pictureName == null){//
//			File dirImage = new File(tomcatDir + "/webapps/" + webDir + "/image");
			File dirImage = new File("D:/专业课程/java/Java开发/_workplace/MyJSP/WebContent/image");
//			File dirImage = new File(System.getProperty("user.dir")+"/WebContent/image");
			pictureName = dirImage.list();
		}
		if(pictureName != null)
			max = pictureName.length;
	}
	public void setImageNumber(int n){
		if(n<0)
			n = max - 1;
		if(n == max)
			n = 0;
		imageNumber = n;
	}
	public int getImageNumber(){
		return imageNumber;
	}
	public String getPlayImage(){
		if(pictureName != null)
			playImage = pictureName[imageNumber];
		return playImage;
	}
}
