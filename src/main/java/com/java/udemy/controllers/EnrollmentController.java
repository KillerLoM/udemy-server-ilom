package com.java.udemy.controllers;

import com.java.udemy.exception.BadRequestException;
import com.java.udemy.models.Course;
import com.java.udemy.models.Enrollment;
import com.java.udemy.models.User;
import com.java.udemy.repository.CourseRepository;
import com.java.udemy.repository.EnrollmentRepository;
import com.java.udemy.repository.UserRepository;
import com.java.udemy.request.EnrollmentRequest;

import com.java.udemy.response.GenericResponse;
import com.java.udemy.response.GetEnrollments;
import com.java.udemy.service.concretions.EnrollmentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/enrollments")
public class EnrollmentController {

    @Autowired
    private EnrollmentRepository enrollmentRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CourseRepository courseRepository;
    @Autowired
    private EnrollmentsService enrollmentsService;

    @PostMapping("/enroll")
    public ResponseEntity<GenericResponse> enrollUserToCourse(@RequestBody EnrollmentRequest enrollmentRequest) {
        String userEmail = enrollmentRequest.getUserEmail();
        Integer courseId = enrollmentRequest.getCourseId();


        User user = userRepository.findByEmail(userEmail).orElse(null);
        Course course = courseRepository.findById(courseId).orElse(null);

        if (user != null && course != null) {
            GenericResponse response = new GenericResponse("SAVED", true);
            Enrollment enrollment = new Enrollment(user, course);
            enrollmentRepository.save(enrollment);
            return ResponseEntity.ok(response);
        } else {
            GenericResponse response = new GenericResponse("FAIL", false);
            return ResponseEntity.badRequest().body(response);
        }
    }

    @GetMapping("/all")
    public List<Enrollment> getAllEnrollments() {
        return enrollmentRepository.findAll();
    }

    @GetMapping("/{enrollmentId}")
    public ResponseEntity<Enrollment> getCourseByEnrollId(@PathVariable Integer enrollmentId) {
        Enrollment enrollment = enrollmentsService.getCourse_idFromEnroll(enrollmentId);
        if (enrollment != null) {
            return ResponseEntity.ok(enrollment);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @GetMapping("/course/{course_id}")
    public ResponseEntity<Enrollment> getEnrollByCourseId(@PathVariable Integer course_id){
        Enrollment response = enrollmentsService.getEnrollFromCourse_id(course_id);
        if (response != null) {
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @PutMapping()
    public ResponseEntity<GenericResponse> updateEnroll(@RequestBody GetEnrollments request){
        try{
            enrollmentsService.updateEnroll(request);
            GenericResponse response  = new GenericResponse("OK",true);
            return new ResponseEntity<>(response, HttpStatusCode.valueOf(206));
        }catch (RuntimeException e){
            throw new BadRequestException(e.getMessage());
        }
    }

}

