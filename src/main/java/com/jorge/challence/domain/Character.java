package com.jorge.challence.domain;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "figure") // character es palabra reservada de MySql
public class Character {
  
  @Id
  @GeneratedValue( strategy = GenerationType.SEQUENCE)
  @Column(name = "id", nullable = false, unique = true)
  private Long id;

  @Column(name = "name", length = 150, nullable = false)
  @Size(min = 3, max = 150)
  private String name;

  @Column(name = "image", length = 250, nullable = false)
  @Size(min = 5, max = 250)
  private String image;

  @Column( name = "age", nullable = false )
  @Size(min = 0, max = 200)
  private int age;

  @Column( name = "weight", nullable = false)
  @Size(min = 0)
  private float weight;

  @Column( name = "history", nullable = false, length = 350)
  @Size(min = 5, max = 350)
  private String history;

  @Column(name = "created_at", nullable = false)
  @Temporal(TemporalType.DATE)
  private Date created_at;

  @Column(name = "updated_at", nullable = false)
  @Temporal(TemporalType.DATE)
  private Date updated_at;

  @Column(name = "deleted_at", nullable = true)
  @Temporal(TemporalType.DATE)
  private Date deleted_at;

  @ManyToMany( cascade = { CascadeType.ALL})
  @JoinTable(
    name = "movie_figure",
    joinColumns = { @JoinColumn( name = "figure_id")},
    inverseJoinColumns = { @JoinColumn(name = "movie_id")}
  )
  private Set<Movie> movies;
}
