package com.yeye.memo.post.bo;

import java.util.Collections;
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
	public List<Post> getMemoList(int userId, Integer nextId, Integer prevId){
		// 다음 버튼
		if(nextId != null){
			return postDAO.selectMemoListByNextId(userId, nextId);
		}else if(prevId != null) { // 이전 버튼
			List<Post> postList = postDAO.selectMemoListByPrevId(userId, prevId);
			Collections.reverse(postList);
			return postList;
		}
		return postDAO.selectMemoList(userId);
		
	}
	
	// 마지막 페이지 확인
	// nextId : 현재 가져온 리스트에서 가장 작은 id	
	public boolean isLastPage(int userId, int nextId) {
		return postDAO.lastPost(userId).getId() == nextId;
	}
	
	public boolean isFirstPage(int userId, int prevId) {
		return postDAO.firstPost(userId).getId() == prevId;
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
