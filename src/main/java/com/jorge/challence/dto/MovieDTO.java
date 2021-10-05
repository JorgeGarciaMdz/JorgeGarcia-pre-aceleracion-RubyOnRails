package com.jorge.challence.dto;

public class MovieDTO {
  private Long id;
  private String title;
  private String image;
  private int qualification;
  private Long gender_id;

  public MovieDTO(){ }

  public MovieDTO(String title, String image, int qualification, Long gender_id) {
    this.title = title;
    this.image = image;
    this.qualification = qualification;
    this.gender_id = gender_id;
  }

  public MovieDTO(Long id, String title, String image, int qualification, Long gender_id) {
    this.id = id;
    this.title = title;
    this.image = image;
    this.qualification = qualification;
    this.gender_id = gender_id;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getImage() {
    return image;
  }

  public void setImage(String image) {
    this.image = image;
  }

  public int getQualification() {
    return qualification;
  }

  public void setQualification(int qualification) {
    this.qualification = qualification;
  }

  public Long getGender_id() {
    return gender_id;
  }

  public void setGender_id(Long gender_id) {
    this.gender_id = gender_id;
  }
}
