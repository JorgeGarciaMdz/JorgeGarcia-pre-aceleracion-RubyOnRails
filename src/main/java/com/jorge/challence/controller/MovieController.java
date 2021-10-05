package com.jorge.challence.controller;

import java.util.HashMap;
import java.util.List;
import com.jorge.challence.dto.MovieDTO;
import com.jorge.challence.dto.MoviesDTO;
import com.jorge.challence.service.MovieService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/movies")
@CrossOrigin("*")
public class MovieController {

  @Autowired
  @Qualifier("v1_mysql")
  private MovieService ms;

  @GetMapping
  public ResponseEntity<?> findAll(){
    HashMap<String, List<MoviesDTO>> h = new HashMap<>();
    h.put("movies", ms.findAll());
    return new ResponseEntity<>(h ,HttpStatus.OK);
  }

  @GetMapping(params = "id")
  public ResponseEntity<?> findById(@RequestParam Long id){
    ms.findById(id);
    return new ResponseEntity<>(ms.findById(id), HttpStatus.OK);
  }

  @PostMapping()
  public ResponseEntity<?> createMovie(@RequestBody MovieDTO m_dto){
    ms.createMovie(m_dto);
    if( m_dto.getId() != null){
      HashMap<String,MovieDTO> h = new HashMap<>();
      h.put("movie", m_dto);
      return new ResponseEntity<>(h, HttpStatus.ACCEPTED);
    } else 
      return new ResponseEntity<>(HttpStatus.UNPROCESSABLE_ENTITY);
  }

  @PutMapping
  public ResponseEntity<?> updateMovie(@RequestBody MovieDTO m_dto){
    ms.updateMovie(m_dto);
    HashMap<String, MovieDTO> h = new HashMap<>();
    h.put("movie", m_dto);
    return new ResponseEntity<>(h, HttpStatus.ACCEPTED);
  }

  @DeleteMapping(params = "id")
  public ResponseEntity<?> deleteMovie(@RequestParam Long id){
    ms.deleteMovie(id);
    return new ResponseEntity<>(HttpStatus.ACCEPTED);
  }
  
}
