package com.jorge.challence.genderDTO;

public class GenderDTO {
  private String name;
  private String image;
  private Long id;

  public GenderDTO( String name, String image){
    this.name = name;
    this.image = image;
  }

  public GenderDTO(){}

  public GenderDTO(Long id, String name, String image){
    this.id = id;
    this.name = name;
    this.image = image;
  }

  public String getName(){
    return this.name;
  }

  public String getImage(){
    return this.image;
  }

  public void setId(Long id) {
    this.id = id;
  }
  public Long getId() {
    return id;
  }
}
