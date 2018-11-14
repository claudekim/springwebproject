package kr.co.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.util.MediaUtils;
import kr.co.util.UploadFileUtils;

@Controller
public class UploadController {

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	@ResponseBody
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		
		//1. 이미지 파일 여부 확인
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		MediaType mt = MediaUtils.getMediaType(formatName);
		//2. 원본파일 이미지 파일부터 삭제
		if(mt != null) {
			String prefix = fileName.substring(0, 12);
			String suffix = fileName.substring(14);
			
			File f = new File(uploadPath + (prefix + suffix).replace('/', File.separatorChar));
			System.out.println(f);
			f.delete();
		} 
			//3. thumbNail 이미지와 일반 파일 삭제
			File f2 = new File(uploadPath + fileName.replace('/', File.separatorChar));
			f2.delete();
		
		// 4. return
		return new ResponseEntity<String>("DELETE_SUCCESS", HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mt = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);
			if(mt != null) {
				headers.setContentType(mt);
			} else {
				fileName = fileName.substring(fileName.lastIndexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); //내려받기 위한 코딩
				headers.add("Content-Disposition", "attachment;fileName=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1"));				
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers,HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}  finally {
			if(in != null) in.close();
		}
		return entity;
	}
	
	
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {
	
	}

	
	
	@ResponseBody
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjax(HttpServletRequest request, MultipartFile file) {
		
//		String uploadPath = request.getServletContext().getRealPath("/resources/img");
		
		ResponseEntity<String> entity = null;
		
			try {
				String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				
				System.out.println(":::::::::::::::::");
				System.out.println(savedName);
				System.out.println(":::::::::::::::::");
				
				entity = new ResponseEntity<String>(savedName, HttpStatus.OK);
				} catch (Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
				}
				
				return entity;
	}
		
	
	
	
	
	
	
	
	
}
