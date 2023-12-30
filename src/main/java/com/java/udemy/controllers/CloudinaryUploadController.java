package com.java.udemy.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.java.udemy.service.concretions.CloudinaryService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/cloudinary/upload")
@RequiredArgsConstructor
public class CloudinaryUploadController {
  @Autowired
  private final CloudinaryService cloudinaryService;

  @PostMapping
  public ResponseEntity<String> uploadFile(@RequestPart("file") MultipartFile file) {
    try{
      Map<String, Object> data = cloudinaryService.upload(file);
      Object fileUrl = data.get("url");
      return new ResponseEntity<>(fileUrl.toString(), HttpStatus.OK);
    }catch (RuntimeException e){
      return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
    }


  }
}
