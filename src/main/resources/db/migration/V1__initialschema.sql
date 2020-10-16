-- App users
create table app_user (
  name varchar (255) primary key,
  email varchar (255) not null,
  password varchar (255) not null,
  enabled TINYINT NOT NULL
);
create table capability (
  name varchar (255) primary key,
  pattern varchar (255) not null
);
create table role (
  name varchar (255) primary key
);
create table role_capability (
  role_name varchar (255),
  capability_name varchar (255),
  primary key (role_name, capability_name),
  foreign key (role_name) REFERENCES role(name)  ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key (capability_name) REFERENCES capability(name)  ON DELETE CASCADE ON UPDATE CASCADE
);
create table user_role (
  user_name varchar (255),
  role_name varchar (255),
  primary key (user_name, role_name),
  foreign key (user_name) REFERENCES app_user(name) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key (role_name) REFERENCES role(name) ON DELETE CASCADE ON UPDATE CASCADE
);
-- Write capabilities
create table role_write_capability (
  role_name varchar (255),
  capability_name varchar (255),
  primary key (role_name, capability_name),
  foreign key (role_name) REFERENCES role(name)  ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key (capability_name) REFERENCES capability(name)  ON DELETE CASCADE ON UPDATE CASCADE
);
--Default users
insert into capability values ('management_users', '/management/users/**');
insert into capability values ('management_roles', '/management/roles/**');
insert into capability values ('management_capabilities', '/management/capabilities/**');

insert into role values ('soporte');
insert into role values ('user');

insert into app_user values ('soporte','soporte','$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.',1);
insert into app_user values ('user','user','$2a$10$EblZqNptyYvcLm/VwDCVAuBjzZOI7khzdyGPBr08PpIi0na624b8.',1);

insert into user_role values ('soporte', 'soporte');
insert into user_role values ('user', 'user');

insert into role_capability values ('soporte', 'management_users');
insert into role_capability values ('soporte', 'management_roles');
insert into role_capability values ('soporte', 'management_capabilities');

insert into role_write_capability values ('soporte', 'management_users');
insert into role_write_capability values ('soporte', 'management_roles');
insert into role_write_capability values ('soporte', 'management_capabilities');
