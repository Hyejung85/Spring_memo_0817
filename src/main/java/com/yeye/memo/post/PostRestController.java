package com.yeye.memo.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.memo.post.bo.PostBO;

@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	// 메모 작성
	@RequestMapping("/create")
	public Map<String, String> create(
			@RequestParam("subject") String subject
			, @RequestParam("content") String content
			, @RequestParam(value = "file", required = false) MultipartFile file 
			, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		// getAttribute는 리턴타입이 object이므로 Integer로 캐스팅한다.
		int userId = (Integer)session.getAttribute("userId");
		
		
		// userId, title, content, file
		int count = postBO.addPost(userId, subject, content, file);
		
		Map<String, String> result = new HashMap<>();
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	//메모 수정
	@RequestMapping("/update")
	public Map<String, String> update(
			@RequestParam("id") int id
			, @RequestParam("subject") String subject
			, @RequestParam("content") String content){
		
		int count = postBO.updateMemo(id, subject, content);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	// 메모 삭제
	@GetMapping("/delete")
	public Map<String, String> delete(
			@RequestParam("id") int id
			, HttpServletRequest request){
		
		
		HttpSession session = request.getSession();
		
		int userId = (Integer) session.getAttribute("userId");
		int count = postBO.deleteMemo(id, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	
}
