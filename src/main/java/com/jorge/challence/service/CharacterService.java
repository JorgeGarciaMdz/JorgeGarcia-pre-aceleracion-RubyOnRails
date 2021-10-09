package com.jorge.challence.service;

import java.util.List;

import com.jorge.challence.dto.CharacterDTO;
import com.jorge.challence.dto.CharactersDTO;

public interface CharacterService {
  
  public void createCharacter( CharacterDTO c_dto);
  public void updateCharacter( CharacterDTO c_dto);
  public void deleteCharacter(Long id);
  public CharacterDTO findById(Long id);
  public List<CharactersDTO> findAll();
  public List<CharactersDTO> findByParams(String name, Integer age, Float weight, Long movies);
}
