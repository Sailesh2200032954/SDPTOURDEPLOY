package com.klef.jfsd.sdpproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.klef.jfsd.sdpproject.model.Spots;

public interface SpotsRepository extends JpaRepository<Spots, Integer> {
    // JpaRepository already has count() method, so no need to define it manually.
}
