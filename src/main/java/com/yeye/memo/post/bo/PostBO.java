package com.yeye.memo.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yeye.memo.common.FileManagerService;
import com.yeye.memo.post.dao.PostDAO;
import com.yeye.memo.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String subject, String content, MultipartFile file) {
		
		String filePath = null;
		
		if(file !=null) {
			
			FileManagerService fileManager = new FileManagerService();
			
			filePath = fileManager.saveFile(userId, file);
			
			
			if(filePath == null) {
				return -1;
			}
		}
	
		return postDAO.insertPost(userId, subject, content, filePath);
	}
	
	// 메모 목록
	public List<Post> getMemoList(int userId){
		return postDAO.selectMemoList(userId);
		
	}
	
	// 메모 상세
	public Post getMemo(int id, int userId) {
		return postDAO.selectMemo(id, userId);
		
	}
	// 메모 업데이트
	public int updateMemo(int id, String subject, String content){
		return postDAO.updatePost(id, subject, content);
	}
	
	// 삭제
	public int deleteMemo(int id, int userId) {
		return postDAO.deletePost(id, userId);
	}
}
