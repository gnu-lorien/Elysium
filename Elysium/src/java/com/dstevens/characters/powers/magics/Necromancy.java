package com.dstevens.characters.powers.magics;

import com.dstevens.characters.PlayerCharacter;
import com.dstevens.characters.powers.Power;

public enum Necromancy implements Power<Necromancy> {

    SEPULCHRE_PATH,
    BONE_PATH,
    ASH_PATH,
    MORTIS_PATH;
    
	@Override
	public Necromancy trait() {
		return this;
	}

	@Override
	public PlayerCharacter applyTo(PlayerCharacter character) {
		return character.withInClanDisciplines(this);
	}
    
}
