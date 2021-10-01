package com.jorge.challence.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table( name = "gender")
public class Gender {
  
  @Id
  @GeneratedValue( strategy = GenerationType.SEQUENCE)
  @Column(name = "id")
  private Long id;

  @Column( name = "name", nullable = false, length = 150)
  @Size( min = 3, max = 150)
  private String name;

  @Column( name = "image", nullable = false, length = 250)
  @Size( min = 10, max = 250)
  private String image;

  @Column(name = "created_at", nullable = false)
  @Temporal(TemporalType.DATE)
  private Date created_at;

  @Column(name = "updated_at", nullable = false)
  @Temporal(TemporalType.DATE)
  private Date updated_at;

  @Column(name = "deleted_at", nullable = true)
  @Temporal(TemporalType.DATE)
  private Date deleted_at;
}
