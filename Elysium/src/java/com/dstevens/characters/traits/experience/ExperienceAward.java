package com.dstevens.characters.traits.experience;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;

import com.dstevens.characters.PlayerCharacter;
import com.dstevens.suppliers.IdSupplier;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ExperienceAward {

	private static final ZoneId UTC = ZoneId.of("Z");
	
	@Id
	private final String id;
	
	@Column(name="value")
	private final int value;
	
	@Column(name="awardedOn")
	private final Date awardedOn;

	@Column(name="awardedFor")
	private final String awardedFor;
	
	//Hibernate only
    @SuppressWarnings("unused")
	@Deprecated
    private ExperienceAward() {
    	this(0, null, null);
    }
	
	public ExperienceAward(int value, Date awardedOn, String awardedFor) {
		this.id = new IdSupplier().get();
		this.value = value;
		this.awardedOn = awardedOn;
		this.awardedFor = awardedFor;
	}

	public final LocalDate changedOn() {
		return awardedOn.toInstant().atZone(UTC).toLocalDate();
	}
	
	public PlayerCharacter award(PlayerCharacter playerCharacter) {
		return playerCharacter.gainXp(value);
	}

}
