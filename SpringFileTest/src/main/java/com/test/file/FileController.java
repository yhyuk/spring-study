package com.test.file;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class FileController {

	@RequestMapping(value = "/add.action", method = { RequestMethod.GET })
	public String add(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		
		return "add";
	}

	@RequestMapping(value = "/addok.action", method = { RequestMethod.POST })
	public String addok(HttpServletRequest req, HttpServletResponse resp, HttpSession session, FileDTO dto) {
		
		// form enctype="multipart/form-data"
		// 1. request 객체의 getParameter 동작 불능
		// 2. cos.jar > MultipartRequest 대신
		
		// Spring
		// 1. request 대체 > MultipartRequest 역할??
		// 2. 'MultipartHttpServletRequest' > 기존의 action 메소드의 인자값인 HttpServletRequest req에게 MultipartHttpServletRequest 객체가 전달
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)req;
		
		System.out.println(dto.getName());
		System.out.println(dto.getSubject());
		
		// 첨부 파일
		// - <input type="file" name="attach" class="form-control" />
		MultipartFile attach =  multi.getFile("attach");
		
		System.out.println(attach.getName()); // 파일 이름이 아닌 태그 이름 "attach"
		System.out.println(attach.getSize()); // 1465838byte 
		System.out.println(attach.getContentType()); // MINE(image/jpeg)
		System.out.println(attach.getOriginalFilename()); // 파일명
		
		// 1. 스프링 파일 업로드 > 파일 중복 처리 기능 없음 > 무조건 덮어쓰기
		// 2. 스프링 파일 업로드 > 업로드 파일 임시 폴더 저장 > 원하는 폴더 직접 이동
		
		// 첨부 파일명이 중복된다면..
		// 	a. 아무것도 안한다.
		//		- 덮어쓰기 발생 > 문제...
		//		- 비권장
		// 	b. 유일한 파일명 생성
		//		- 틱값, 파일명
		//		- 현재시각 + 파일명
		// 	c. 인덱스 처리
		//		- 파일명 + 숫자 붙이기
		
		String filename = attach.getOriginalFilename();
		String path = req.getRealPath("resources/files");
		System.out.println(path);
		
		// 파일명 중복 방지 방법1. ("틱값_파일명")
		// filename = System.currentTimeMillis() + "_" + filename;
		
		// 파일명 중복 방지 방법2.
		filename = getFileName(path, filename); 
		
		File file = new File(path + "\\" + filename);
		
		// 임시 폴더 -> files 폴더 이동하기		
		try {
			// file.renameTo(file)
			attach.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		// 하지만 문제점.. 똑같은 파일명일 때 덮어쓰기가 됨..
		
		req.setAttribute("filename", filename);
		
		return "addok";
	}
	
	@RequestMapping(value = "/download.action", method = { RequestMethod.GET })
	public void download(HttpServletRequest request, 
						HttpServletResponse response, 
						HttpSession session, 
						String filename) throws Exception {
		
		// 파일 다운로드와 연관된 여러가지 비지니스 업무를 추가로 구현할 수 있다.
		// 1. 권한 확인 > session 확인
		// 2. 다운로드 횟수 누적 > DB 연동
		// 3. 로그 기록..
		
		ServletContext context = request.getSession().getServletContext();

	      
		String savePath = "/resources/files";
	      
		String sDownloadPath = context.getRealPath(savePath);

		String sFilePath = sDownloadPath + "/" + filename;
		byte b[] = new byte[4096];
	      FileInputStream in = new FileInputStream(sFilePath);
	      String sMimeType = context.getMimeType(sFilePath);
	      System.out.println("sMimeType>>>" + sMimeType);

	      if (sMimeType == null)
	         sMimeType = "application/octet-stream";// MIME. 브라우저에게 해석할 수 없는 데이터라고 타입을 속여서 보내는 작업 중 하나

	      response.setContentType(sMimeType);
	      
	      String agent = request.getHeader("User-Agent");
	      boolean ieBrowser = (agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1);

	      if (ieBrowser) {
	         filename = URLEncoder.encode(filename, "UTF-8").replaceAll("/+", "%20");
	      } else {
	         filename = new String(filename.getBytes("UTF-8"), "iso-8859-1");
	      }

	      response.setHeader("Content-Disposition", "attachment; filename= " + filename);

	      ServletOutputStream out2 = response.getOutputStream();
	      int numRead;

	      while ((numRead = in.read(b, 0, b.length)) != -1) {
	         out2.write(b, 0, numRead);
	      }

	      out2.flush();
	      out2.close();
	      in.close();
		
	}
	

	private String getFileName(String path, String filename) {
		
		// 저장 폴더내의 유일한 파일명 만들기
		// path = "resources/files"
		// filename = "dog.png"
		
		// dog.png -> dog_1.png
		// dog.png -> dog(1).png
		// dog.png -> dog[1].png
		
		int n = 1; // 인덱싱 숫자
		int index = filename.lastIndexOf("."); // 확장자에 붙는 "."을 찾기위한 lastIndexOf
		String tempName = filename.substring(0, index); // "파일명"
		String tempExt = filename.substring(index); // ".확장자"
		
		
		while(true) {
			
			// files/파일명.확장자가 존재하는지 검사
			File file = new File(path + "\\" + filename);
			
			if (file.exists()) {
				// 있다면.. 중복됨.. > 인덱싱 처리
				filename = tempName + "_" + n + tempExt; // "파일명_1.확장자"
				n++;
			} else {
				// 없다면.. 사용가능
				return filename;
			}
		}
		
	}
	
	
}
