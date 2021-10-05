package com.jorge.challence.service;

import com.jorge.challence.dto.CharacterDTO;

public interface CharacterService {
  
  public void createCharacter( CharacterDTO c_dto);
  public void updateCharacter( CharacterDTO c_dto);
  public void deleteCharacter(Long id);
  public CharacterDTO findById(Long id);
}
