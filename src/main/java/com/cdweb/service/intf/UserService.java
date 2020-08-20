package com.cdweb.service.intf;

import java.util.List;

import javax.validation.Valid;

import com.cdweb.model.UserModel;

public interface UserService {

	List<UserModel> findAllById(int offset, int numItem, String searchedString);

	Boolean detele(String id);

	UserModel getOne(String id);

	Boolean modifyUser(@Valid UserModel userModel);

	List<UserModel> findAllSortedByModifiedDate(int offset, int numItem);

}
