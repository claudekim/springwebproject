package kr.co.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;


public class UploadFileUtils {

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		//1파일 새로운이름만들기
		UUID uid=UUID.randomUUID();
		String prefix=uid.toString();
		String savedName=prefix+"_"+originalName;
		
		String savedPath=calcPath(uploadPath);//2폴더 이름만들기(calcPath) &폴더 만들기(makeDir) 소환
		
		File target= new File(uploadPath+savedPath,savedName);//4파일 업로드파일
		FileCopyUtils.copy(fileData, target); //5 파일 업로드

		//=====================================
		//6 확장자 구하기
		int lastPoint = originalName.lastIndexOf(".");//라스트 포인트 오리지널파일네임에서 .이 어디에 있는지 몇번째
		String formatName = originalName.substring(lastPoint+1);//포멧내임 오리지널파일네임에서 확장자추출
		//이미지파일여부 png gif jpg 확장자 
		
		//8.이미지파일일때는 섬네일파일을 만든다 이미지가 아니면 그냥 아이콘저장
		String uploadFileName=null;
		
		MediaType mt = MediaUtils.getMediaType(formatName);//포멧네임에서 얻은확장자 검사받기
		
		if(mt!=null) { //같은게 있어서 검사값돌아오면 
			uploadFileName = makeThumbnail(uploadPath,savedPath,savedName);
		}else { //없어서 안돌아오면
			uploadFileName = makeIcon(uploadPath,savedPath,savedName);
		}
		
		return uploadFileName;
	}
	//=====================================
	private static String makeIcon(String uploadPath, String savedPath, String savedName) {
		// TODO Auto-generated method stub
		String iconName = uploadPath+savedPath+File.separator+savedName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	//=====================================
	private static String makeThumbnail(String uploadPath, String savedPath, String savedName) throws IOException {
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath+savedPath, savedName));
		
		BufferedImage destImg= Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_EXACT,100);
		
		String ThumbnailName=uploadPath+savedPath+File.separator+"s_"+savedName;//저장할파일 지정
		String formatName = savedName.substring(savedName.lastIndexOf(".")+1);//
		File newFile = new File(ThumbnailName);//파일복사
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		// 2018//10/.\;01//s_nid~~.png
		return ThumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		//역슬레시 슬레시로 바꿔줬음
	}

	//=====================================
	private static String calcPath(String uploadPath) {//폴더 이름만들기
		Calendar cal=Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath,yearPath,monthPath ,datePath );//폴더 만들기소환
		return datePath;
	}//calcPath(끝ㅌ)

	//=====================================
	//바라그스 varadas? ...paths 순서가 중요햐ㅏ대요
	private static void makeDir(String uploadPath, String... paths) {//폴더 만들기
		File f1 = new File( uploadPath+ paths[paths.length - 1]);
		
		if (f1.exists()) {
			return;
		}
		
		for (String path : paths) {
			File f = new File(uploadPath + path);
			if (!f.exists()) {
				f.mkdirs();
			}
		}
		
	}//makeDir(끝ㅌ)

}
