package com.yeye.memo.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yeye.memo.post.bo.PostBO;
import com.yeye.memo.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostBO postBO;
	
	@GetMapping("/create_view")
	public String createView() {
		return "post/createView";
	}
	
	@GetMapping("/list_view")
	public String listView(
			@RequestParam(value="nextId", required=false) Integer nextId
			, @RequestParam(value="prevId", required=false) Integer prevId
			, Model model
			,HttpServletRequest request) {
		
		// 로그인한 본인의 메모만 볼 수있도록 한다.
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		// 10 9 8 | 7 6 5 | 4 3 2| 1
		List<Post> memoList = postBO.getMemoList(userId, nextId, prevId);

		int currentNextId = 0;
		int currentPrevId  = 0;
		
		// 마지막 페이지가 아니면 nextId 셋팅
		int listLastIndex = memoList.get(memoList.size()-1).getId();
		if(!postBO.isLastPage(userId, listLastIndex)) {
			currentNextId = listLastIndex;
		}
		
		int listFirstIndex = memoList.get(0).getId();
		if(!postBO.isFirstPage(userId, listFirstIndex)) {
			currentPrevId = listFirstIndex;
		}
		
		
		model.addAttribute("memoList", memoList);
		model.addAttribute("nextId", currentNextId);
		model.addAttribute("prevId", currentPrevId);
		
		return "post/memoList";
	}
	
	@GetMapping("/detail_view")
	public String detailView(
			@RequestParam("id") int id
			, Model model
			,HttpServletRequest request) {
		// 로그인한 본인의 메모만 볼 수있도록 한다.
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Post post = postBO.getMemo(id, userId);
		model.addAttribute("post", post);
		
		return "post/detailView";
	}
	

}
