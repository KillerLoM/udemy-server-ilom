package com.java.udemy.service.abstractions;

import com.java.udemy.models.Enrollment;
import com.java.udemy.response.GenericResponse;
import com.java.udemy.response.GetEnrollments;

public interface IEnrollmentsService {
    Enrollment getCourse_idFromEnroll (int id);
    Enrollment getEnrollFromCourse_id(int id);
    void updateEnroll(GetEnrollments request);
}
