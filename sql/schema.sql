
create table music_albums(
  id serial primary key not Null,
  published_date date,
  on_spotify boolean,
  archived boolean
);

create table genre (
  id serial primary key not Null,
  name varchar(32)
);