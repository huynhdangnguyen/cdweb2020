package com.cdweb.repository.intf;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdweb.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String>{
	UserEntity findOneByIdAndStatus(String id, int status);

	Page<UserEntity> findAllByStatus(Pageable pageable, int activateStatus);
}
