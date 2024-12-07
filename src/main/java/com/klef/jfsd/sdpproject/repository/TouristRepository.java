package com.klef.jfsd.sdpproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdpproject.model.Tourist;

import jakarta.transaction.Transactional;
import java.util.List;


@Repository
public interface TouristRepository extends JpaRepository<Tourist, Integer>
{
	@Query("select t from Tourist t where t.email=?1 and t.password=?2")
	public Tourist checktourlogin(String email,String pwd);
	
	
	

	    // Check if email already exists
	    boolean existsByEmail(String email);

	    // Check if contact number already exists
	    boolean existsByContact(String contact);




		public Tourist findByEmailAndPassword(String email, String pwd);
	
}
