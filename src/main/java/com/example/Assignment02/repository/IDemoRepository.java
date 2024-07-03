package com.example.Assignment02.repository;

import com.example.Assignment02.entity.Demo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface IDemoRepository extends JpaRepository<Demo, Long> {
}
