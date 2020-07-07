package com.cdweb.repository.intf;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdweb.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String>, UserRepositoryCustom{

}
