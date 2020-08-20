package com.cdweb.repository.intf;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cdweb.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String>{
	UserEntity findOneByIdAndStatus(String id, int status);

	Page<UserEntity> findAllByStatus(Pageable pageable, int activateStatus);

	@Query("SELECT u FROM UserEntity u WHERE u.id LIKE %?1% AND u.status = ?2")
	Page<UserEntity> findAllByIdAndStatus(String searchedString, int activateStatus, Pageable pageable);
}
