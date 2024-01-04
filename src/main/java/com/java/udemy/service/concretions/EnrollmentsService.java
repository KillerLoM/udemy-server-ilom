package com.java.udemy.service.concretions;

import com.java.udemy.models.Enrollment;
import com.java.udemy.repository.EnrollmentRepository;
import com.java.udemy.response.GetEnrollments;
import com.java.udemy.service.abstractions.IEnrollmentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EnrollmentsService implements IEnrollmentsService {
    @Autowired
    private EnrollmentRepository enrollmentRepository;
    @Override
    public GetEnrollments getCourse_idFromEnroll(int id) {
        Enrollment model = enrollmentRepository.findById(id);
        GetEnrollments response = new GetEnrollments(model.getId(), model.getIsCompleted(), model.getProgress(), model.getCreatedAt(), model.getUpdatedAt(), model.getCourse().getId());
        return response;
    }
}
