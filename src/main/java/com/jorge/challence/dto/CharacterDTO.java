package com.jorge.challence.dto;

import java.util.HashSet;
import java.util.Set;

public class CharacterDTO {
  private Long id;
  private String name;
  private String image;
  private int age;
  private float weight;
  private String history;
  private Set<String> movies = new HashSet<>();
  private Long movie_id;

  public CharacterDTO() {
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getImage() {
    return image;
  }

  public void setImage(String image) {
    this.image = image;
  }

  public int getAge() {
    return age;
  }

  public void setAge(int age) {
    this.age = age;
  }

  public float getWeight() {
    return weight;
  }

  public void setWeight(float weight) {
    this.weight = weight;
  }

  public String getHistory() {
    return history;
  }

  public void setHistory(String history) {
    this.history = history;
  }

  public void addMovie(String movie){
    movies.add(movie);
  }

  public Set<String> getMovies() {
    return movies;
  }

  public Long getMovie_id() {
    return movie_id;
  }

  public void setMovie_id(Long movie_id) {
    this.movie_id = movie_id;
  }
}
