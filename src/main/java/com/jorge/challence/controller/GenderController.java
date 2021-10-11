package com.jorge.challence.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import java.util.HashMap;
import java.util.List;

import com.jorge.challence.dto.GenderDTO;
import com.jorge.challence.service.GenderService;

@RestController
@RequestMapping("/api/v1/genders")
@CrossOrigin("*")
public class GenderController {
  
  @Autowired
  @Qualifier("v1_mysql")
  private GenderService gs;
  
  @GetMapping
  public ResponseEntity<?> findAllGenders(){
    HashMap<String, List<GenderDTO>> h = new HashMap<>();
    h.put("genders", gs.findall());
    return new ResponseEntity<>(h, HttpStatus.OK);
  }

  // @RequestMapping( value = "/{id}", method = RequestMethod.GET)
  // public ResponseEntity<?> findById( @PathVariable(name = "id") Long id){
  @RequestMapping( params = "id", method = RequestMethod.GET)
  public ResponseEntity<?> findById( @RequestParam(name = "id") Long id){
    HashMap<String, GenderDTO> h = new HashMap<>();
    h.put("gender", gs.findById(id));
    return new ResponseEntity<>(h, HttpStatus.OK);
  }

  @RequestMapping( params = "name", method = RequestMethod.GET)
  public ResponseEntity<?> findByName(@RequestParam String name){
    HashMap<String, List<GenderDTO>> h = new HashMap<>();
    h.put("genders", gs.findByName(name));
    return new ResponseEntity<>(h, HttpStatus.OK);
  }

  @PostMapping
  public ResponseEntity<?> createGender(@RequestBody GenderDTO gdto){
    HashMap<String, GenderDTO> h = new HashMap<>();
    h.put("gender", gs.saveGender(gdto));
    return new ResponseEntity<>(h, HttpStatus.ACCEPTED);
  }

  @PutMapping
  public ResponseEntity<?> updateGender(@RequestBody GenderDTO g_dto){
    HashMap<String, GenderDTO> h = new HashMap<>();
    h.put("gender", gs.updateGender(g_dto));
    return new ResponseEntity<>(h, HttpStatus.ACCEPTED);
  }

  @DeleteMapping( params = "id")
  public ResponseEntity<?> deleteGender(@RequestParam Long id){
    gs.deleteGender(id);
    return new ResponseEntity<>(HttpStatus.ACCEPTED);
  }
}
