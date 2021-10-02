package com.jorge.challence.domain;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "movie")
public class Movie {
  
  @Id
  @GeneratedValue( strategy = GenerationType.SEQUENCE)
  @Column(name = "id")
  private Long id;

  @Column( name = "title", nullable = false, length = 150)
  @Size( min = 3, max = 150)
  private String title;

  @Column( name = "image", nullable = false, length = 250 )
  @Size(min = 10, max = 250)
  private String image;

  @Column( name = "qualification", nullable = false)
  @Size(min = 0, max = 5)
  private int qualification;

  @Column(name = "created_at", nullable = false)
  @Temporal(TemporalType.DATE)
  private Date created_at;

  @Column(name = "updated_at", nullable = false)
  @Temporal(TemporalType.DATE)
  private Date updated_at;

  @Column(name = "deleted_at", nullable = true)
  @Temporal(TemporalType.DATE)
  private Date deleted_at;

  @ManyToOne
  @JoinColumn( name = "gender_id", nullable = false)
  private Gender gender;

  @ManyToMany(mappedBy = "movies")
  private Set<Character> characters;
}
