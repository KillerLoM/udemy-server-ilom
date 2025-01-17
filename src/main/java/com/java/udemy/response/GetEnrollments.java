package com.java.udemy.response;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;
import java.time.Instant;
import java.util.Date;

@Data
@AllArgsConstructor
public class GetEnrollments {
    private int id;
    private boolean isCompleted;
    private BigDecimal progress;
    private int course_id;
    private int nextPosition;
}
