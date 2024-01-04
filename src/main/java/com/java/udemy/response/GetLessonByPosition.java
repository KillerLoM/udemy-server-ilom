package com.java.udemy.response;

import com.java.udemy.models.Lesson;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Optional;

@Data
@AllArgsConstructor
public class GetLessonByPosition {
    private int id;
    private String lessonName;
    private int position;
    private String video_url;
}
