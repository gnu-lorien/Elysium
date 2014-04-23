package com.dstevens.characters.traits;

import javax.persistence.*;

import com.dstevens.characters.PlayerCharacter;
import com.dstevens.utilities.ObjectExtensions;

@Entity
@Inheritance
@DiscriminatorColumn(name="trait_change_type")
@Table(name="TraitChanges")
public abstract class TraitChangeEvent {

    @Id
    private final String id;
    
    @Column(name="character_id")
    private final String characterId;
    
    @Column(name="status")
    private TraitChangeStatus status;
    
    //Hibernate only
    @SuppressWarnings("unused")
    @Deprecated
    private TraitChangeEvent() {
        this(null, null, null);
    }
    
    public TraitChangeEvent(String id, String characterId, TraitChangeStatus status) {
        this.id = id;
        this.characterId = characterId;
        this.status = status;
    }
    
    public final PlayerCharacter approve(PlayerCharacter character) {
        return status.apply(character, this);
    }
    
    public final PlayerCharacter deny(PlayerCharacter character) {
        return status.deny(character, this);
    }

    public final void setStatus(TraitChangeStatus status) {
        this.status = status;
    }
    
    public abstract PlayerCharacter apply(PlayerCharacter character);
    
    @Override
    public final String toString() {
        return ObjectExtensions.toStringFor(this);
    }

    
}
