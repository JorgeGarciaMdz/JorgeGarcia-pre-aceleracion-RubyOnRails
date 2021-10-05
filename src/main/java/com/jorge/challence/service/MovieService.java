package com.jorge.challence.service;

import java.util.List;

import com.jorge.challence.domain.Movie;
import com.jorge.challence.dto.MovieDTO;
import com.jorge.challence.dto.MovieDetailDTO;
import com.jorge.challence.dto.MoviesDTO;

public interface MovieService {
  public List<MoviesDTO> findAll();
  public MovieDetailDTO findById(Long id);
  public Movie findByIdMovie(Long id);
  public void createMovie(MovieDTO m_dto);
  public void updateMovie(MovieDTO m_dto);
  public void deleteMovie(Long id);
}
