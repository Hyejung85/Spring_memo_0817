package com.yeye.memo.user.bo;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeye.memo.common.EncryptUtils;
import com.yeye.memo.user.dao.UserDAO;
import com.yeye.memo.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	public int signUp(String loginId, String password, String name, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		if(encryptPassword.equals("")) {
			logger.error("[UserBO signUp] 암호화 실패!!");
			return 0;
		}
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
	}
	// 아이디 중복확인
	public boolean isDuplicateId(String loginId) {
		if(userDAO.selectCountById(loginId) == 0) {
			return false;
		}else {
			return true;
		}
		
		// return (userDAO.selectCountById(loginId) != 0);
	}
	
//	public signIn (String loginId, String password) {
//		// 비밀번호를 암호화하고 dao로 전달한다.
//		String encryptPassword = EncryptUtils.md5(password);
//		if(userDAO.selcetLoginIdPassword(loginId, encryptPassword) == 0) {
//			return false;
//		}else {
//			return true;
//		}
		
	public User signIn(String loginId, String password) {
		//비밀번호를 압호화하고 dao로 전달한다. 
		String encryptPassword = EncryptUtils.md5(password);
		return userDAO.selcetUserByIdPassword(loginId, encryptPassword);
	}
}
