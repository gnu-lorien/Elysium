package com.dstevens.characters;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface PlayerCharacterDao extends CrudRepository<PlayerCharacter, String> {
    
    @Query("SELECT a FROM PlayerCharacter a WHERE a.name = ?1 AND a.deleteTimestamp is null")
    PlayerCharacter findUndeletedNamed(String name);
    
    @Query("SELECT a FROM PlayerCharacter a WHERE a.name = ?1")
    Iterable<PlayerCharacter> findNamed(String name);
    
}
