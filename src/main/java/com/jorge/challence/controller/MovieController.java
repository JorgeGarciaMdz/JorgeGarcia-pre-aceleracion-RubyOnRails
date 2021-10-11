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

  // @GetMapping
  // public ResponseEntity<?> findAll(){
  //   HashMap<String, List<MoviesDTO>> h = new HashMap<>();
  //   h.put("movies", ms.findAll());
  //   return new ResponseEntity<>(h ,HttpStatus.OK);
  // }
  @GetMapping
  public ResponseEntity<?> findByParams(
    @RequestParam ( value = "name", required = false) String name,
    @RequestParam ( value = "genre", required = false) Long genre,
    @RequestParam ( value = "order", required = false) String order
  ){
    HashMap<String, List<MoviesDTO>> h = new HashMap<>();
    h.put("movies", ms.findByParams(name, genre, order));
    return new ResponseEntity<>(h ,HttpStatus.OK);
  }

  @GetMapping(params = "id")
  public ResponseEntity<?> findById(@RequestParam Long id){
    HashMap<String, Object> h = new HashMap<>();
    h.put("movie", ms.findById(id));
    return new ResponseEntity<>(h, HttpStatus.OK);
  }

  @PostMapping("/add_character")
  public ResponseEntity<?> addCharacterToMovie(
    @RequestParam(name = "character_id", required = true) Long character_id,
    @RequestParam(name = "movie_id", required = true) Long movie_id
    ){
    ms.addCharacterToMovie(character_id, movie_id);
    return new ResponseEntity<>(HttpStatus.ACCEPTED);
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
