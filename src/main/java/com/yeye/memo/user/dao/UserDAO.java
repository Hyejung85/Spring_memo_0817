package com.yeye.memo.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yeye.memo.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(
			@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name")String name
			, @Param("email") String email);
	
	public int selectCountById(@Param("loginId") String loginId);
	
	public User selcetUserByIdPassword(
			@Param("loginId") String loginId
			, @Param("password")  String password);
}
