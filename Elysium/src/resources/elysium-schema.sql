alter table TroupePlayers drop foreign key FK_hqwwgbic7k81k6tmmowmmsu6f;
alter table TroupePlayers drop foreign key FK_jp8wcfbseex1hvlwwm8ig7y2i;
drop table if exists Player;
drop table if exists Troupe;
drop table if exists TroupePlayers;
create table Player (id bigint not null auto_increment, setting varchar(255), name varchar(255), primary key (id));
create table Troupe (id bigint not null auto_increment, name varchar(255), setting integer, primary key (id));
create table TroupePlayers (troupe_id bigint not null, player_id bigint not null);
alter table TroupePlayers add constraint UK_hqwwgbic7k81k6tmmowmmsu6f  unique (player_id);
alter table TroupePlayers add constraint FK_hqwwgbic7k81k6tmmowmmsu6f foreign key (player_id) references Player (id);
alter table TroupePlayers add constraint FK_jp8wcfbseex1hvlwwm8ig7y2i foreign key (troupe_id) references Troupe (id);
