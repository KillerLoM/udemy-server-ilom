package com.java.udemy.service.concretions;

import com.java.udemy.exception.BadRequestException;
import com.java.udemy.models.Course;
import com.java.udemy.models.Enrollment;
import com.java.udemy.repository.CourseRepository;
import com.java.udemy.repository.EnrollmentRepository;
import com.java.udemy.response.GenericResponse;
import com.java.udemy.response.GetEnrollments;
import com.java.udemy.service.abstractions.IEnrollmentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.Optional;

@Service
public class EnrollmentsService implements IEnrollmentsService {
    @Autowired
    private EnrollmentRepository enrollmentRepository;
    @Autowired
    private CourseRepository courseRepository;
    @Override
    public Enrollment getCourse_idFromEnroll(int id) {
        Enrollment model = enrollmentRepository.findById(id);
        return model;
    }

    @Override
    public Enrollment getEnrollFromCourse_id(int id) {
        try{
            Optional<Course> courseModel = courseRepository.findById(id);
            Enrollment model = enrollmentRepository.findEnrollmentByCourse(courseModel);
            return model;
        }catch (RuntimeException e){
            throw new BadRequestException(e.getMessage());
        }
    }

    @Override
    public void updateEnroll(GetEnrollments request) {

        Optional<Course> course = courseRepository.findById(request.getCourse_id());
        if(course.isEmpty()){
            throw new ResponseStatusException(HttpStatusCode.valueOf(400),"FAIL");
        }
        Enrollment model = enrollmentRepository.findById(request.getId());
        model.setProgress(request.getProgress());
        model.setIsCompleted(request.isCompleted());
        model.setNextPosition(request.getNextPosition());
        enrollmentRepository.save(model);

    }

}
