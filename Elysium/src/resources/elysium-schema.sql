alter table CharacterBackgroundFocuses drop foreign key FK_4qcem68m5nd0oorn5wl7026lv;
alter table CharacterBackgrounds drop foreign key FK_qpb6qx3ftrx3cvwq58pohfla9;
alter table CharacterDisciplines drop foreign key FK_29xtftybs69gp7w9dsgeibaal;
alter table CharacterElderPowers drop foreign key FK_9xvhtifdwl1cmju12ho8fmshy;
alter table CharacterFlaws drop foreign key FK_8stiuvgb83d18dvresvy987ef;
alter table CharacterMerits drop foreign key FK_gjbya9lym9wle0m04nwi3u9ia;
alter table CharacterNecromanticPaths drop foreign key FK_2w5o2hjair8otn89tofydu17u;
alter table CharacterSkillFocuses drop foreign key FK_csdgm0guwoth8oipoocrveid5;
alter table CharacterSkills drop foreign key FK_5kfiec2mlewwqsadpa7hu2tkv;
alter table CharacterTechniques drop foreign key FK_k308w4cg751heco93d5bxfd5i;
alter table CharacterThamaturgicalPaths drop foreign key FK_m37ttpa7tlv4l5c0vg6atvv24;
alter table CharacterThamaturgicalRituals drop foreign key FK_h0xpkkpm3que9jrac3njhlhk3;
alter table InClanDisciplines drop foreign key FK_ruvoqw73xqn2ka4mli0hdee78;
alter table InClanNecromancy drop foreign key FK_2078egw5b463ntpecgwp0sda3;
alter table InClanThaumaturgy drop foreign key FK_dafjwphmauwrvtr5xdtcpdd58;
alter table MentalAttributeFocus drop foreign key FK_38t6simowsb7yh5tjrneuou59;
alter table PhysicalAttributeFocus drop foreign key FK_dl819kw7t9nxad92pj55meseh;
alter table PlayerPlayerCharacters drop foreign key FK_kbp7aw5ct1sphnq1ce7phgmog;
alter table PlayerPlayerCharacters drop foreign key FK_pen5pjh79qieycqn88f8f0oku;
alter table SocialAttributeFocus drop foreign key FK_mt22vhigi1bjr6ra1dj9yqwqn;
alter table TraitChangeFocuses drop foreign key FK_nariv87pf9728kp6ytvq9u2db;
alter table TraitChanges drop foreign key FK_ojvoa61iti8tg2v4nn0j1orkr;
alter table TraitChanges drop foreign key FK_k11wnuiumq0y1wjn68b0o4haq;
alter table TroupePlayerCharacters drop foreign key FK_7fw6ag0gryhsw0pb7dbi370p0;
alter table TroupePlayerCharacters drop foreign key FK_7gtgrvxyhpg9a16a8mxtn6t4j;
alter table TroupePlayers drop foreign key FK_jp8wcfbseex1hvlwwm8ig7y2i;
alter table TroupePlayers drop foreign key FK_hqwwgbic7k81k6tmmowmmsu6f;
drop table if exists AuditEvent;
drop table if exists CharacterBackgroundFocuses;
drop table if exists CharacterBackgrounds;
drop table if exists CharacterDisciplines;
drop table if exists CharacterElderPowers;
drop table if exists CharacterFlaws;
drop table if exists CharacterMerits;
drop table if exists CharacterNecromanticPaths;
drop table if exists CharacterSkillFocuses;
drop table if exists CharacterSkills;
drop table if exists CharacterTechniques;
drop table if exists CharacterThamaturgicalPaths;
drop table if exists CharacterThamaturgicalRituals;
drop table if exists InClanDisciplines;
drop table if exists InClanNecromancy;
drop table if exists InClanThaumaturgy;
drop table if exists MentalAttribute;
drop table if exists MentalAttributeFocus;
drop table if exists PhysicalAttribute;
drop table if exists PhysicalAttributeFocus;
drop table if exists Player;
drop table if exists PlayerCharacter;
drop table if exists PlayerPlayerCharacters;
drop table if exists SocialAttribute;
drop table if exists SocialAttributeFocus;
drop table if exists TraitChangeFocuses;
drop table if exists TraitChanges;
drop table if exists Troupe;
drop table if exists TroupePlayerCharacters;
drop table if exists TroupePlayers;
create table AuditEvent (id varchar(255) not null, audit_message varchar(255), audited_type varchar(255), audited_id varchar(255), timestamp datetime, primary key (id));
create table CharacterBackgroundFocuses (CharacterBackground_id varchar(255) not null, focus varchar(255));
create table CharacterBackgrounds (id varchar(255) not null, background integer, character_id varchar(255), rating integer, specialization varchar(255), primary key (id));
create table CharacterDisciplines (character_id varchar(255) not null, power integer, rating integer not null, primary key (character_id, rating));
create table CharacterElderPowers (PlayerCharacter_id varchar(255) not null, elder_power integer);
create table CharacterFlaws (PlayerCharacter_id varchar(255) not null, details varchar(255), flaw_id integer, flaw_type varchar(255));
create table CharacterMerits (PlayerCharacter_id varchar(255) not null, details varchar(255), merit_id integer, merit_type varchar(255));
create table CharacterNecromanticPaths (character_id varchar(255) not null, path integer, rating integer not null, primary key (character_id, rating));
create table CharacterSkillFocuses (CharacterSkill_id varchar(255) not null, focus varchar(255));
create table CharacterSkills (id varchar(255) not null, character_id varchar(255), rating integer, skill integer, specialization varchar(255), primary key (id));
create table CharacterTechniques (PlayerCharacter_id varchar(255) not null, technique integer);
create table CharacterThamaturgicalPaths (character_id varchar(255) not null, path integer, rating integer not null, primary key (character_id, rating));
create table CharacterThamaturgicalRituals (PlayerCharacter_id varchar(255) not null, thaumaturgical_ritual integer, neromantic_ritual integer);
create table InClanDisciplines (PlayerCharacter_id varchar(255) not null, in_clan_discipline integer);
create table InClanNecromancy (PlayerCharacter_id varchar(255) not null, in_clan_necromancy integer);
create table InClanThaumaturgy (PlayerCharacter_id varchar(255) not null, in_clan_thaumaturgy integer);
create table MentalAttribute (character_id varchar(255) not null, rating integer, primary key (character_id));
create table MentalAttributeFocus (character_id varchar(255) not null, focuses integer);
create table PhysicalAttribute (character_id varchar(255) not null, rating integer, primary key (character_id));
create table PhysicalAttributeFocus (character_id varchar(255) not null, focuses integer);
create table Player (id varchar(255) not null, deleted_at datetime, email varchar(255), name varchar(255), primary key (id));
create table PlayerCharacter (id varchar(255) not null, bloodline integer, clan integer, deleted_at datetime, name varchar(255), primary_necromantic_path integer, primary_thaumaturgical_path integer, xp integer, primary key (id));
create table PlayerPlayerCharacters (player_id varchar(255), character_id varchar(255) not null, primary key (player_id, character_id));
create table SocialAttribute (character_id varchar(255) not null, rating integer, primary key (character_id));
create table SocialAttributeFocus (character_id varchar(255) not null, focuses integer);
create table TraitChangeFocuses (SetSkillEvent_id varchar(255) not null, focus varchar(255));
create table TraitChanges (trait_change_type varchar(31) not null, id varchar(255) not null, character_id varchar(255), status integer, rating integer, ordinal integer, specialization varchar(255), purchased_change_id varchar(255), order_by integer, primary key (id));
create table Troupe (id varchar(255) not null, deleted_at datetime, name varchar(255), setting integer, primary key (id));
create table TroupePlayerCharacters (troupe_id varchar(255), character_id varchar(255) not null, primary key (troupe_id, character_id));
create table TroupePlayers (player_id varchar(255) not null, troupe_id varchar(255) not null, primary key (troupe_id, player_id));
alter table PlayerPlayerCharacters add constraint UK_pen5pjh79qieycqn88f8f0oku  unique (character_id);
alter table TroupePlayerCharacters add constraint UK_7gtgrvxyhpg9a16a8mxtn6t4j  unique (character_id);
alter table CharacterBackgroundFocuses add constraint FK_4qcem68m5nd0oorn5wl7026lv foreign key (CharacterBackground_id) references CharacterBackgrounds (id);
alter table CharacterBackgrounds add constraint FK_qpb6qx3ftrx3cvwq58pohfla9 foreign key (character_id) references PlayerCharacter (id);
alter table CharacterDisciplines add constraint FK_29xtftybs69gp7w9dsgeibaal foreign key (character_id) references PlayerCharacter (id);
alter table CharacterElderPowers add constraint FK_9xvhtifdwl1cmju12ho8fmshy foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table CharacterFlaws add constraint FK_8stiuvgb83d18dvresvy987ef foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table CharacterMerits add constraint FK_gjbya9lym9wle0m04nwi3u9ia foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table CharacterNecromanticPaths add constraint FK_2w5o2hjair8otn89tofydu17u foreign key (character_id) references PlayerCharacter (id);
alter table CharacterSkillFocuses add constraint FK_csdgm0guwoth8oipoocrveid5 foreign key (CharacterSkill_id) references CharacterSkills (id);
alter table CharacterSkills add constraint FK_5kfiec2mlewwqsadpa7hu2tkv foreign key (character_id) references PlayerCharacter (id);
alter table CharacterTechniques add constraint FK_k308w4cg751heco93d5bxfd5i foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table CharacterThamaturgicalPaths add constraint FK_m37ttpa7tlv4l5c0vg6atvv24 foreign key (character_id) references PlayerCharacter (id);
alter table CharacterThamaturgicalRituals add constraint FK_h0xpkkpm3que9jrac3njhlhk3 foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table InClanDisciplines add constraint FK_ruvoqw73xqn2ka4mli0hdee78 foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table InClanNecromancy add constraint FK_2078egw5b463ntpecgwp0sda3 foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table InClanThaumaturgy add constraint FK_dafjwphmauwrvtr5xdtcpdd58 foreign key (PlayerCharacter_id) references PlayerCharacter (id);
alter table MentalAttributeFocus add constraint FK_38t6simowsb7yh5tjrneuou59 foreign key (character_id) references MentalAttribute (character_id);
alter table PhysicalAttributeFocus add constraint FK_dl819kw7t9nxad92pj55meseh foreign key (character_id) references PhysicalAttribute (character_id);
alter table PlayerPlayerCharacters add constraint FK_kbp7aw5ct1sphnq1ce7phgmog foreign key (player_id) references Player (id);
alter table PlayerPlayerCharacters add constraint FK_pen5pjh79qieycqn88f8f0oku foreign key (character_id) references PlayerCharacter (id);
alter table SocialAttributeFocus add constraint FK_mt22vhigi1bjr6ra1dj9yqwqn foreign key (character_id) references SocialAttribute (character_id);
alter table TraitChangeFocuses add constraint FK_nariv87pf9728kp6ytvq9u2db foreign key (SetSkillEvent_id) references TraitChanges (id);
alter table TraitChanges add constraint FK_ojvoa61iti8tg2v4nn0j1orkr foreign key (purchased_change_id) references TraitChanges (id);
alter table TraitChanges add constraint FK_k11wnuiumq0y1wjn68b0o4haq foreign key (character_id) references PlayerCharacter (id);
alter table TroupePlayerCharacters add constraint FK_7fw6ag0gryhsw0pb7dbi370p0 foreign key (troupe_id) references Troupe (id);
alter table TroupePlayerCharacters add constraint FK_7gtgrvxyhpg9a16a8mxtn6t4j foreign key (character_id) references PlayerCharacter (id);
alter table TroupePlayers add constraint FK_jp8wcfbseex1hvlwwm8ig7y2i foreign key (troupe_id) references Troupe (id);
alter table TroupePlayers add constraint FK_hqwwgbic7k81k6tmmowmmsu6f foreign key (player_id) references Player (id);
