package com.cdweb.repository.intf;

import com.cdweb.entity.UserEntity;

public interface UserRepositoryCustom {
	UserEntity findOneByUserNameAndStatus(String name, int status);
}
