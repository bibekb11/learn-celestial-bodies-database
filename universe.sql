CREATE TABLE galaxy(
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(40) NOT NULL UNIQUE,
  description TEXT,
  radius NUMERIC(25,3),
  solar_mass INT,
  no_of_stars INT,
  has_black_hole BOOLEAN NOT NULL,
  is_spiral BOOLEAN 
);

CREATE TABLE star(
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(40) NOT NULL UNIQUE,
  description TEXT,
  radius NUMERIC(25,3),
  solar_mass INT,
  no_of_planets INT,
  is_binary BOOLEAN NOT NULL,
  has_planets BOOLEAN,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet(
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(40) NOT NULL UNIQUE,
  description TEXT,
  radius NUMERIC(15,3),
  solar_mass INT,
  no_of_moons INT,
  is_habitable BOOLEAN NOT NULL,
  has_life BOOLEAN,
  star_id INT NOT NULL REFERENCES star(star_id)
);


CREATE TABLE moon(
  moon_id SERIAL PRIMARY KEY,
  name varchar(40) NOT NULL UNIQUE,
  description TEXT,
  radius NUMERIC(10,3),
  solar_mass INT,
  no_of_volcanoes INT,
  has_atmosphere BOOLEAN NOT NULL,
  is_tidally_locked BOOLEAN,
  planet_id INT NOT NULL REFERENCES planet(planet_id)
);


CREATE TABLE civilization(
  civilization_id SERIAL PRIMARY KEY,
  name VARCHAR(40) NOT NULL UNIQUE,
  description TEXT,
  population INT,
  type INT CHECK(TYPE BETWEEN 0 AND 3),
  fleet_size INT,
  is_space_faring BOOLEAN NOT NULL,
  is_extinct BOOLEAN,
  planet_id INT NOT NULL REFERENCES planet(planet_id)
);

INSERT INTO galaxy (name, description, radius, solar_mass, no_of_stars, has_black_hole, is_spiral) VALUES
('Milky Way', 'Our home galaxy', 100000, 1500000, 100000, TRUE, TRUE),
('Andromeda', 'Nearest spiral galaxy', 110000, 1600000, 1000000, TRUE, TRUE),
('Triangulum', 'Small spiral galaxy', 60000, 500000, 40000, FALSE, TRUE),
('Whirlpool', 'Known for spiral arms', 35000, 1200000, 100000, TRUE, TRUE),
('Sombrero', 'Bright nucleus galaxy', 29000, 800000, 80000, TRUE, FALSE),
('Black Eye', 'Dark band of dust', 43000, 850000, 90000, FALSE, TRUE);

INSERT INTO star (name, description, radius, solar_mass, no_of_planets, is_binary, has_planets, galaxy_id) VALUES
('Sun', 'Star of Milky Way', 696000, 1989, 8, FALSE, TRUE, 1),
('Alpha Centauri', 'Binary system', 695000, 2200, 5, TRUE, TRUE, 1),
('Sirius', 'Brightest star in sky', 1190000, 4000, 4, FALSE, TRUE, 2),
('Betelgeuse', 'Red supergiant', 900000, 2000, 2, FALSE, TRUE, 3),
('Rigel', 'Blue supergiant', 800000, 2500, 3, FALSE, TRUE, 4),
('Vega', 'Bright star in Lyra', 600000, 3000, 6, FALSE, TRUE, 5);

INSERT INTO planet (name, description, radius, solar_mass, no_of_moons, is_habitable, has_life, star_id) VALUES
('Earth', 'Habitable planet', 6371, 5972, 1, TRUE, TRUE, 1),
('Mars', 'Red planet', 3390, 641, 2, FALSE, FALSE, 1),
('Venus', 'Thick atmosphere', 6052, 4868, 0, FALSE, FALSE, 1),
('Proxima b', 'Exoplanet', 7000, 700, 0, FALSE, FALSE, 2),
('Sirius b1', 'Rocky exoplanet', 5000, 500, 1, FALSE, FALSE, 3),
('Sirius b2', 'Gas giant', 60000, 1200, 2, FALSE, FALSE, 3),
('Betel p1', 'Hot planet', 4500, 350, 0, FALSE, FALSE, 4),
('Betel p2', 'Cold planet', 4700, 330, 1, FALSE, FALSE, 4),
('Rigel p1', 'Blue planet', 4900, 380, 0, FALSE, FALSE, 5),
('Rigel p2', 'Water world', 5100, 400, 1, TRUE, FALSE, 5),
('Vega p1', 'Habitable candidate', 6000, 450, 3, TRUE, FALSE, 6),
('Vega p2', 'Desert world', 5500, 300, 1, FALSE, FALSE, 6);

INSERT INTO moon (name, description, radius, solar_mass, no_of_volcanoes, has_atmosphere, is_tidally_locked, planet_id) VALUES
('Moon', 'Natural satellite of Earth', 1737, 7342, 0, FALSE, TRUE, 1),
('Phobos', 'Moon of Mars', 11, 106, 0, FALSE, FALSE, 2),
('Deimos', 'Moon of Mars', 6, 147, 0, FALSE, FALSE, 2),
('Aphrodite', 'Venus moon', 1500, 250, 1, FALSE, TRUE, 3),
('Centauri I', 'Moon of Proxima b', 1200, 300, 1, FALSE, TRUE, 4),
('Sirius a1', 'Moon of Sirius b1', 1000, 200, 0, FALSE, FALSE, 5),
('Sirius a2', 'Another moon', 900, 150, 1, FALSE, FALSE, 6),
('Sirius a3', 'Gas moon', 800, 120, 1, FALSE, FALSE, 6),
('Betel x', 'Hot orbiting moon', 700, 100, 2, FALSE, TRUE, 7),
('Betel y', 'Small cold moon', 600, 90, 0, FALSE, FALSE, 8),
('Rigel m1', 'Orbiting icy moon', 500, 80, 0, FALSE, TRUE, 9),
('Rigel m2', 'Water moon', 1000, 100, 1, TRUE, TRUE, 10),
('Vega luna', 'Moon with potential', 1500, 200, 1, FALSE, FALSE, 11),
('Vega terra', 'Dusty moon', 1400, 190, 2, FALSE, TRUE, 11),
('Vega luna 2', 'Frozen moon', 1200, 160, 0, FALSE, FALSE, 11),
('Vega m1', 'Bright moon', 1000, 130, 1, TRUE, TRUE, 12),
('Vega m2', 'Volcanic moon', 950, 125, 2, FALSE, TRUE, 12),
('Vega m3', 'Rocky moon', 890, 110, 1, FALSE, FALSE, 12),
('Vega m4', 'Blueish moon', 880, 108, 1, FALSE, FALSE, 12),
('Vega m5', 'Dusty trail', 870, 107, 1, FALSE, TRUE, 12);

INSERT INTO civilization (name, description, population, type, fleet_size, is_space_faring, is_extinct, planet_id) VALUES
('Terran Federation', 'Highly advanced space-faring humans', 8000000000, 1, 500, TRUE, FALSE, 1),
('Martian Syndicate', 'Colonial society on Mars', 1500000, 0, 20, FALSE, FALSE, 2),
('Andromedan Remnants', 'Ancient civilization now extinct', 0, 3, 0, TRUE, TRUE, 4);
