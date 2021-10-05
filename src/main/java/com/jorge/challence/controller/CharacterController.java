package com.jorge.challence.controller;

import java.util.HashMap;

import com.jorge.challence.dto.CharacterDTO;
import com.jorge.challence.service.CharacterService;

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
@RequestMapping("/api/v1/characters")
@CrossOrigin("*")
public class CharacterController {

  @Autowired
  @Qualifier("v1_mysql")
  private CharacterService cs;

  @PostMapping
  public ResponseEntity<?> createCharacter(@RequestBody CharacterDTO c_dto) {
    cs.createCharacter(c_dto);
    if (c_dto.getId() != null) {
      HashMap<String, CharacterDTO> h = new HashMap<>();
      h.put("character", c_dto);
      return new ResponseEntity<>(h, HttpStatus.ACCEPTED);
    } else
      return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
  }

  @PutMapping
  public ResponseEntity<?> updateCharacter(@RequestBody CharacterDTO c_dto){
    cs.updateCharacter(c_dto);
    HashMap<String, CharacterDTO> h = new HashMap<>();
    h.put("character", c_dto);
    return new ResponseEntity<>(h, HttpStatus.ACCEPTED);
  }

  @DeleteMapping( params = "id")
  public ResponseEntity<?> deleteCharacter(@RequestParam Long id){
    cs.deleteCharacter(id);
    return new ResponseEntity<>(HttpStatus.ACCEPTED);
  }

  @GetMapping(params = "id")
  public ResponseEntity<?> findById(@RequestParam Long id){
    CharacterDTO c_dto = cs.findById(id);
    if( c_dto != null){
      HashMap<String, CharacterDTO> h = new HashMap<>();
      h.put("character", c_dto);
      return new ResponseEntity<>(h, HttpStatus.OK);
    }
    return new ResponseEntity<>(HttpStatus.NOT_FOUND);
  }
}
