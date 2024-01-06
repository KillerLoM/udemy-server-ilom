package com.java.udemy.models;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.Instant;
import java.util.Objects;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import org.hibernate.Hibernate;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonProperty;

import jakarta.persistence.*;
import javax.validation.constraints.Max;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
@Table(name = "enrollments", uniqueConstraints = @UniqueConstraint(columnNames = { "user_id", "course_id" }))
public class Enrollment {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Integer id;

  @ManyToOne(optional = false, fetch = FetchType.LAZY)
  @JsonBackReference
  @JoinColumn(name = "user_id")

  @OnDelete(action = OnDeleteAction.CASCADE)
  private User user;

  @ManyToOne(optional = false, fetch = FetchType.LAZY)
  @JoinColumn(name = "course_id")
  @JsonBackReference
  @OnDelete(action = OnDeleteAction.CASCADE)
  private Course course;

  @Column(nullable = false)
  @ColumnDefault(value = "false")
  private Boolean isCompleted = false;

  @ColumnDefault(value = "1")
  private Integer nextPosition = 1;

  @ColumnDefault("0")
  @Max(100)
  @Column(nullable = false, precision = 6, scale = 2)
  private BigDecimal progress = BigDecimal.ZERO;

  @CreationTimestamp
  @JsonProperty(access = JsonProperty.Access.READ_ONLY)
  @Column(nullable = false)
  private Instant createdAt;

  @UpdateTimestamp
  @JsonProperty(access = JsonProperty.Access.READ_ONLY)
  private Instant updatedAt = null;

  public Enrollment(User user, Course course) {
    this.user = user;
    this.course = course;
  }

  public int getCourse_id() {
    return course != null ? course.getId() : null;
  }



  public BigDecimal getProgress() {
    return progress.setScale(0, RoundingMode.HALF_UP);
  }

  @Override
  public boolean equals(Object o) {
    if (this == o)
      return true;
    if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o))
      return false;
    Enrollment that = (Enrollment) o;
    return id != null && Objects.equals(id, that.id);
  }

  @Override
  public int hashCode() {
    return getClass().hashCode();
  }
  @PreUpdate
  public void preUpdate() {
    this.updatedAt = Instant.now();
  }
}
