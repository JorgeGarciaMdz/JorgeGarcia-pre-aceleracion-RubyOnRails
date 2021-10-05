package com.jorge.challence.serviceImplement;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.jorge.challence.domain.Character;
import com.jorge.challence.domain.Gender;
import com.jorge.challence.domain.Movie;
import com.jorge.challence.dto.CharactersDTO;
import com.jorge.challence.dto.MovieDTO;
import com.jorge.challence.dto.MovieDetailDTO;
import com.jorge.challence.dto.MoviesDTO;
import com.jorge.challence.repository.MovieRepository;
import com.jorge.challence.service.GenderService;
import com.jorge.challence.service.MovieService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("v1_mysql")
public class MovieServiceI implements MovieService {

  @Autowired
  private MovieRepository mr;

  @Autowired
  @Qualifier("v1_mysql")
  private GenderService gs;

  @Override
  public List<MoviesDTO> findAll() {
    List<Movie> m = mr.findByDeletedAtIsNull();
    List<MoviesDTO> m_dto = new ArrayList<>();
    for (Movie i : m) {
      m_dto.add(new MoviesDTO(i.getId(), i.getTitle(), i.getImage(), i.getCreatedAt()));
    }
    return m_dto;
  }

  @Override
  public MovieDetailDTO findById(Long id) {
    Optional<Movie> m = mr.findByIdAndDeletedAtIsNull(id);
    if( m.isPresent()){
      MovieDetailDTO md_dto = new MovieDetailDTO();
      md_dto.setId(m.get().getId());
      md_dto.setTitle(m.get().getTitle());
      md_dto.setImage(m.get().getImage());
      md_dto.setQualification(m.get().getQualification());
      md_dto.setCreated_at(m.get().getCreatedAt());
      for(Character c: m.get().getCharacters()){
        md_dto.addCharacters(new CharactersDTO(c.getId(), c.getName()));
      }
      return md_dto;
    }
    return null;
  }

  @Override
  public Movie findByIdMovie(Long id) {
    Optional<Movie> m = mr.findByIdAndDeletedAtIsNull(id);
    if( m.isPresent())
      return m.get();
    return null;
  }

  @Override
  public void createMovie(MovieDTO m_dto) {
    Gender g = gs.findbyId(m_dto.getGender_id());
    if (g != null) {
      Movie m = new Movie();
      m.setTitle(m_dto.getTitle());
      m.setImage(m_dto.getImage());
      m.setQualification(m_dto.getQualification());
      m.setCreatedAt(new Date());
      m.setUpdatedAt(new Date());
      m.setGender(g);
      mr.saveAndFlush(m);
      m_dto.setId(m.getId());
    }
  }

  @Override
  public void updateMovie(MovieDTO m_dto) {
    Optional<Movie> m = mr.findByIdAndDeletedAtIsNull(m_dto.getId());
    if (m.isPresent()) {
      Gender g = gs.findbyId(m_dto.getGender_id());
      if (g != null) {
        m.get().setTitle(m_dto.getTitle());
        m.get().setImage(m_dto.getImage());
        m.get().setQualification(m_dto.getQualification());
        m.get().setUpdatedAt(new Date());
        m.get().setGender(g);
        mr.saveAndFlush(m.get());
      }
    }
  }

  @Override
  public void deleteMovie(Long id) {
    Optional<Movie> m = mr.findByIdAndDeletedAtIsNull(id);
    if( m.isPresent()){
      m.get().setDeletedAt(new Date());
      m.get().getCharacters().clear();
      mr.saveAndFlush(m.get());
    }
  }
}
