alter table CharacterBackground_focuses drop foreign key FK_gwyci7jpuwu0q3mucbf5q5rjq;
alter table CharacterSkill_focuses drop foreign key FK_m55thyly94po4rbmw03iay1u8;
alter table Player drop foreign key FK_ks4oof9guph2qvo7v6cqdiefx;
alter table PlayerCharacter drop foreign key FK_1wbxymbhm40bq5goo5laqy756;
alter table PlayerCharacter drop foreign key FK_2tvilr6gkaifhe9fei568ij7b;
alter table PlayerCharacter_Backgrounds drop foreign key FK_sbgnuo1acckqxcli46ppvgdjg;
alter table PlayerCharacter_Backgrounds drop foreign key FK_d8hsl2hafdvj2w4shbe7tkkem;
alter table PlayerCharacter_Skills drop foreign key FK_qqe336af9uubmj4p0vrfn2dql;
alter table PlayerCharacter_Skills drop foreign key FK_2obr2a1fm8bw42ftns86cgrek;
alter table PlayerCharacter_TraitChanges drop foreign key FK_s5e9fv5uoth36s44agn30vqtt;
alter table PlayerCharacter_TraitChanges drop foreign key FK_ebyhdsyremvpge52v5g3ckdqt;
alter table PlayerCharacter_disciplines drop foreign key FK_htjrnnity1j1a20tfqycw81i0;
alter table PlayerCharacter_elderPowers drop foreign key FK_ib17duab5vkt9ktbwnuip9pt6;
alter table PlayerCharacter_flaws drop foreign key FK_s683o5gfxsj7kvw550iofa495;
alter table PlayerCharacter_inClanDisciplines drop foreign key FK_hxlgrncs0yx9dyqwxjt1yolfl;
alter table PlayerCharacter_inClanNecromanticPaths drop foreign key FK_3bt4quwnhkg4vrscvg02crbkk;
alter table PlayerCharacter_inClanThaumaturgicalPaths drop foreign key FK_slihxxwbsbcx8hcwsv472jqgj;
alter table PlayerCharacter_mentalAttrbuteFocuses drop foreign key FK_808fg23c9kbk88t9op0w6f12j;
alter table PlayerCharacter_merits drop foreign key FK_qh4nguxvaourku8p79b7vwxg9;
alter table PlayerCharacter_necromanticPaths drop foreign key FK_b9com0fojfl95gexlyi389v6a;
alter table PlayerCharacter_necromanticRituals drop foreign key FK_2924iru4nhtb5di1tqnd64ccu;
alter table PlayerCharacter_physicalAttributeFocuses drop foreign key FK_2xo1ogweg5af26d3ovvfgl456;
alter table PlayerCharacter_socialAttributeFocuses drop foreign key FK_b3t8yilwsai51ae4qv4puejvq;
alter table PlayerCharacter_techniques drop foreign key FK_68v6altvayqooj1qsfcjflosk;
alter table PlayerCharacter_thaumaturgicalPaths drop foreign key FK_8j1wew7bthyowmms3qy46n4ue;
alter table PlayerCharacter_thaumaturgicalRituals drop foreign key FK_30m3pmwi16yxvinc7hyxs7re;
alter table SetCharacterDefinedTrait_focuses drop foreign key FK_jd7np5p8o3a5kglmjqrq81ogl;
alter table TraitChanges drop foreign key FK_trjv65o55d9qe3vx7n1oopgui;
drop table if exists AuditEvent;
drop table if exists Backgrounds;
drop table if exists CharacterBackground_focuses;
drop table if exists CharacterSkill_focuses;
drop table if exists Player;
drop table if exists PlayerCharacter;
drop table if exists PlayerCharacter_Backgrounds;
drop table if exists PlayerCharacter_Skills;
drop table if exists PlayerCharacter_TraitChanges;
drop table if exists PlayerCharacter_disciplines;
drop table if exists PlayerCharacter_elderPowers;
drop table if exists PlayerCharacter_flaws;
drop table if exists PlayerCharacter_inClanDisciplines;
drop table if exists PlayerCharacter_inClanNecromanticPaths;
drop table if exists PlayerCharacter_inClanThaumaturgicalPaths;
drop table if exists PlayerCharacter_mentalAttrbuteFocuses;
drop table if exists PlayerCharacter_merits;
drop table if exists PlayerCharacter_necromanticPaths;
drop table if exists PlayerCharacter_necromanticRituals;
drop table if exists PlayerCharacter_physicalAttributeFocuses;
drop table if exists PlayerCharacter_socialAttributeFocuses;
drop table if exists PlayerCharacter_techniques;
drop table if exists PlayerCharacter_thaumaturgicalPaths;
drop table if exists PlayerCharacter_thaumaturgicalRituals;
drop table if exists SetCharacterDefinedTrait_focuses;
drop table if exists Skills;
drop table if exists TraitChanges;
drop table if exists Troupe;
create table AuditEvent (id varchar(255) not null, audit_message varchar(255), audited_type varchar(255), audited_id varchar(255), timestamp datetime, primary key (id));
create table Backgrounds (id varchar(255) not null, rating integer, specialization varchar(255), background integer, primary key (id));
create table CharacterBackground_focuses (CharacterBackground_id varchar(255) not null, focuses varchar(255));
create table CharacterSkill_focuses (CharacterSkill_id varchar(255) not null, focuses varchar(255));
create table Player (id varchar(255) not null, deleted_at datetime, email varchar(255), name varchar(255), troupe_id varchar(255), primary key (id));
create table PlayerCharacter (id varchar(255) not null, bloodline integer, clan integer, deleted_at datetime, mental_attribute integer, name varchar(255), physical_attribute integer, primary_necromantic_path integer, primary_thaumaturgical_path integer, social_attribute integer, xp integer, player_id varchar(255), troupe_id varchar(255), primary key (id));
create table PlayerCharacter_Backgrounds (PlayerCharacter_id varchar(255) not null, backgrounds_id varchar(255) not null, primary key (PlayerCharacter_id, backgrounds_id));
create table PlayerCharacter_Skills (PlayerCharacter_id varchar(255) not null, skills_id varchar(255) not null, primary key (PlayerCharacter_id, skills_id));
create table PlayerCharacter_TraitChanges (PlayerCharacter_id varchar(255) not null, traitChangeEvents_id varchar(255) not null, order_by integer not null, primary key (PlayerCharacter_id, order_by));
create table PlayerCharacter_disciplines (PlayerCharacter_id varchar(255) not null, rating integer not null, trait integer not null, primary key (PlayerCharacter_id, rating, trait));
create table PlayerCharacter_elderPowers (PlayerCharacter_id varchar(255) not null, elderPowers integer);
create table PlayerCharacter_flaws (PlayerCharacter_id varchar(255) not null, details varchar(255), flaw_id integer, flaw_type varchar(255));
create table PlayerCharacter_inClanDisciplines (PlayerCharacter_id varchar(255) not null, inClanDisciplines integer);
create table PlayerCharacter_inClanNecromanticPaths (PlayerCharacter_id varchar(255) not null, inClanNecromanticPaths integer);
create table PlayerCharacter_inClanThaumaturgicalPaths (PlayerCharacter_id varchar(255) not null, inClanThaumaturgicalPaths integer);
create table PlayerCharacter_mentalAttrbuteFocuses (PlayerCharacter_id varchar(255) not null, mentalAttrbuteFocuses integer);
create table PlayerCharacter_merits (PlayerCharacter_id varchar(255) not null, details varchar(255), merit_id integer, merit_type varchar(255));
create table PlayerCharacter_necromanticPaths (PlayerCharacter_id varchar(255) not null, power integer not null, rating integer not null, primary key (PlayerCharacter_id, power, rating));
create table PlayerCharacter_necromanticRituals (PlayerCharacter_id varchar(255) not null, necromanticRituals integer);
create table PlayerCharacter_physicalAttributeFocuses (PlayerCharacter_id varchar(255) not null, physicalAttributeFocuses integer);
create table PlayerCharacter_socialAttributeFocuses (PlayerCharacter_id varchar(255) not null, socialAttributeFocuses integer);
create table PlayerCharacter_techniques (PlayerCharacter_id varchar(255) not null, techniques integer);
create table PlayerCharacter_thaumaturgicalPaths (PlayerCharacter_id varchar(255) not null, rating integer not null, trait integer not null, primary key (PlayerCharacter_id, rating, trait));
create table PlayerCharacter_thaumaturgicalRituals (PlayerCharacter_id varchar(255) not null, thaumaturgicalRituals integer);
create table SetCharacterDefinedTrait_focuses (SetCharacterDefinedTrait_id varchar(255) not null, focuses varchar(255));
create table Skills (id varchar(255) not null, rating integer, specialization varchar(255), skill integer, primary key (id));
create table TraitChanges (trait_change_type varchar(31) not null, id varchar(255) not null, status integer, ordinal integer, rating integer, factory integer, specialization varchar(255), typeIdentifier varchar(255), associatedTrait_id varchar(255), primary key (id));
create table Troupe (id varchar(255) not null, deleted_at datetime, name varchar(255), setting integer, primary key (id));
alter table PlayerCharacter_Backgrounds add constraint UK_sbgnuo1acckqxcli46ppvgdjg  unique (backgrounds_id);
alter table PlayerCharacter_Skills add constraint UK_qqe336af9uubmj4p0vrfn2dql  unique (skills_id);
alter table PlayerCharacter_TraitChanges add constraint UK_s5e9fv5uoth36s44agn30vqtt  unique (traitChangeEvents_id);
alter table CharacterBackground_focuses add constraint FK_gwyci7jpuwu0q3mucbf5q5rjq foreign key (CharacterBackground_id) references Backgrounds (id);
alter table CharacterSkill_focuses add constraint FK_m55thyly94po4rbmw03iay1u8 foreign key (CharacterSkill_id) references Skills (id);
alter table Player add constraint FK_ks4oof9guph2qvo7v6cqdiefx foreign key (troupe_id) references Troupe (id);
alter table PlayerCharacter add constraint FK_1wbxymbhm40bq5goo5laqy756 foreign key (player_id) references Player (id);
alter table PlayerCharacter add constraint FK_2tvilr6gkaifhe9fei568ij7b foreign key (troupe_id) references Troupe (id);
alter table PlayerCharacter_Backgrounds add constraint FK_sbgnuo1acckqxcli46ppvgdjg foreign key (backgrounds_id) references Backgrounds (id);
alter table PlayerCharacter_Backgrounds add constraint FK_d8hsl2hafdvj2w4shbe7tkkem foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_Skills add constraint FK_qqe336af9uubmj4p0vrfn2dql foreign key (skills_id) references Skills (id);
alter table PlayerCharacter_Skills add constraint FK_2obr2a1fm8bw42ftns86cgrek foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_TraitChanges add constraint FK_s5e9fv5uoth36s44agn30vqtt foreign key (traitChangeEvents_id) references TraitChanges (id);
alter table PlayerCharacter_TraitChanges add constraint FK_ebyhdsyremvpge52v5g3ckdqt foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_disciplines add constraint FK_htjrnnity1j1a20tfqycw81i0 foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_elderPowers add constraint FK_ib17duab5vkt9ktbwnuip9pt6 foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_flaws add constraint FK_s683o5gfxsj7kvw550iofa495 foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_inClanDisciplines add constraint FK_hxlgrncs0yx9dyqwxjt1yolfl foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_inClanNecromanticPaths add constraint FK_3bt4quwnhkg4vrscvg02crbkk foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_inClanThaumaturgicalPaths add constraint FK_slihxxwbsbcx8hcwsv472jqgj foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_mentalAttrbuteFocuses add constraint FK_808fg23c9kbk88t9op0w6f12j foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_merits add constraint FK_qh4nguxvaourku8p79b7vwxg9 foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_necromanticPaths add constraint FK_b9com0fojfl95gexlyi389v6a foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_necromanticRituals add constraint FK_2924iru4nhtb5di1tqnd64ccu foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_physicalAttributeFocuses add constraint FK_2xo1ogweg5af26d3ovvfgl456 foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_socialAttributeFocuses add constraint FK_b3t8yilwsai51ae4qv4puejvq foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_techniques add constraint FK_68v6altvayqooj1qsfcjflosk foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_thaumaturgicalPaths add constraint FK_8j1wew7bthyowmms3qy46n4ue foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table PlayerCharacter_thaumaturgicalRituals add constraint FK_30m3pmwi16yxvinc7hyxs7re foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table SetCharacterDefinedTrait_focuses add constraint FK_jd7np5p8o3a5kglmjqrq81ogl foreign key (SetCharacterDefinedTrait_id) references TraitChanges (id);
alter table TraitChanges add constraint FK_trjv65o55d9qe3vx7n1oopgui foreign key (associatedTrait_id) references TraitChanges (id);
