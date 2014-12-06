package com.dstevens.characters.changes;

import java.util.Set;

import com.dstevens.characters.powers.magics.Necromancy;
import com.dstevens.characters.traits.CharacterDefinedTrait;
import com.dstevens.characters.traits.EnumeratedTrait;
import com.dstevens.characters.traits.RatedTrait;

public enum TraitFactory {
    IN_CLAN_NECROMANCY {
        @Override
        public EnumeratedTrait<?> traitFor(int ordinal) {
            return Necromancy.values()[ordinal];
        }

        @SuppressWarnings("unchecked")
        @Override
        public <E extends Enum<?>> E trait(int ordinal) {
            return (E) Necromancy.values()[ordinal];
        }
    };
    
    public EnumeratedTrait<?> traitFor(int ordinal) {
        throw new IllegalStateException("Enumerated trait factory is undefined for " + this.getClass().getName() + " ordinal " + ordinal);
    }
    
    public RatedTrait<?> traitFor(int ordinal, int rating) {
        throw new IllegalStateException("Rated trait factory is undefined");
    }
    
    public CharacterDefinedTrait<?> traitFor(int ordinal, int rating, String specialization, Set<String> focuses) {
        throw new IllegalStateException("Character defined factory is undefined");
    }
    
    public abstract <E extends Enum<?>> E trait(int ordinal);
    
}
