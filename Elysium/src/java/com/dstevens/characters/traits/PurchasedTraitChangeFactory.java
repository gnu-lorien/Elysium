package com.dstevens.characters.traits;

import java.util.Set;

import com.dstevens.characters.PlayerCharacter;
import com.dstevens.characters.traits.attributes.MentalAttributeFocus;
import com.dstevens.characters.traits.attributes.PhysicalAttributeFocus;
import com.dstevens.characters.traits.attributes.SocialAttributeFocus;
import com.dstevens.characters.traits.backgrounds.Background;
import com.dstevens.characters.traits.distinctions.Flaw;
import com.dstevens.characters.traits.distinctions.Merit;
import com.dstevens.characters.traits.distinctions.SetFlawBuilder;
import com.dstevens.characters.traits.distinctions.SetMeritBuilder;
import com.dstevens.characters.traits.powers.ElderPower;
import com.dstevens.characters.traits.powers.Power;
import com.dstevens.characters.traits.powers.Ritual;
import com.dstevens.characters.traits.powers.SetElderPowerBuilder;
import com.dstevens.characters.traits.powers.SetInClanPowerBuilder;
import com.dstevens.characters.traits.powers.SetTechniqueBuilder;
import com.dstevens.characters.traits.powers.Technique;
import com.dstevens.characters.traits.skills.Skill;

public class PurchasedTraitChangeFactory implements TraitChangeFactory {

    private PlayerCharacter character;
    private final ProvidedTraitChangeFactory traitChangeFactory = new ProvidedTraitChangeFactory();
    
    PurchasedTraitChangeFactory(PlayerCharacter character) {
        this.character = character;
    }

	@Override
	public SetTrait physical(PlayerCharacter character) {
		return ChangeExperience.spend(3).and(traitChangeFactory.physical(character));
	}
	
	@Override
	public SetTrait social(PlayerCharacter character) {
		return ChangeExperience.spend(3).and(traitChangeFactory.social(character));
	}
	
	@Override
	public SetTrait mental(PlayerCharacter character) {
		return ChangeExperience.spend(3).and(traitChangeFactory.mental(character));
	}
    
    @Override
	public SetTrait physicalFocus(PhysicalAttributeFocus focus) {
    	throw new IllegalStateException("Cannot purchase attribute focuses");
    }
    
    @Override
	public SetTrait mentalFocus(MentalAttributeFocus focus) {
    	throw new IllegalStateException("Cannot purchase attribute focuses");
    }
    
    @Override
	public SetTrait socialFocus(SocialAttributeFocus focus) {
    	throw new IllegalStateException("Cannot purchase attribute focuses");
    }

    @Override
	public SetTrait skill(Skill skill, int rating, String specialization, Set<String> focuses) {
    	return costForSkill(rating).and(traitChangeFactory.skill(skill, rating, specialization, focuses));
    }
    
	
	private ChangeExperience costForSkill(int rating) {
		if(character.getGeneration().orElse(1) == 1) {
			return ChangeExperience.spend(rating);
		} else {
			return ChangeExperience.spend(rating * 2);
		}
	}
    
	@Override
	public SetTrait background(Background background, int rating, String specialization, Set<String> focuses) {
		return costForBackground(rating).and(traitChangeFactory.background(background, rating, specialization, focuses));
	}
	
	private ChangeExperience costForBackground(int rating) {
		if(character.getGeneration().orElse(1) == 1) {
    		return ChangeExperience.spend(rating);
    	} else {
    		return ChangeExperience.spend(rating * 2);
    	}
	}
    
	@Override
	public SetTrait power(Power<?> power, int rating) {
		return costForPower(power, rating).and(traitChangeFactory.power(power, rating));
	}
	
    private SetTrait costForPower(Power<?> power, int rating) {
    	int cost = 0;
    	boolean inClan = character.getInClanDisciplines().contains(power);
    	if(inClan) {
    		cost = rating * 3;
    	} else {
    		if(character.getGeneration().orElse(1) == 5) {
        		cost = rating * 5;
        	} else {
        		cost = rating * 4;
        	}	
    	}
    	return ChangeExperience.spend(cost);
    }

	@Override
	public SetTrait ritual(Ritual<?> ritual) {
		return ChangeExperience.spend(ritual.rating() * 2).and(traitChangeFactory.ritual(ritual));
	}
    
    @Override
	public SetMeritBuilder merit(Merit merit, String specialization, SetTrait associatedTrait) {
    	return new SetMeritBuilder(merit, specialization, associatedTrait);
    }
    
    @Override
	public SetFlawBuilder flaw(Flaw flaw, String specialization, SetTrait associatedTrait) {
    	return new SetFlawBuilder(flaw, specialization, associatedTrait);
    }

	@Override
	public SetTechniqueBuilder technique(Technique technique) {
		return new SetTechniqueBuilder(character, technique);
	}

	@Override
	public SetElderPowerBuilder elderPower(ElderPower power) {
		return new SetElderPowerBuilder(character, power);
	}

	@Override
	public SetInClanPowerBuilder inClanPower(Power<?> power) {
		return new SetInClanPowerBuilder(power);
	}
}
