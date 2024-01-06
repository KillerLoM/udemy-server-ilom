package com.java.udemy.repository;

import com.java.udemy.models.Course;
import com.java.udemy.models.Enrollment;
import com.java.udemy.response.GetEnrollments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface EnrollmentRepository extends JpaRepository<Enrollment, Integer> {
    Enrollment findById(int id);
    Enrollment findEnrollmentByCourse(Optional<Course> course);

}