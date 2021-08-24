package com.yeye.memo.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.memo.common.FileManagerService;
import com.yeye.memo.post.dao.PostDAO;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String subject, String content, MultipartFile file) {
		
		FileManagerService fileManager = new FileManagerService();
		
		String filePath = fileManager.saveFile(userId, file);
		
		
		if(filePath == null) {
			return -1;
		}
	
		return postDAO.insertPost(userId, subject, content, filePath);
	}

}
