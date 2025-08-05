CREATE TABLE user (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(20),
    user_password VARCHAR(30),
    user_email VARCHAR(20),
    user_number INTEGER
);

CREATE TABLE beam (
    id SERIAL PRIMARY KEY,
    beam_length DOUBLE PRECISION NOT NULL,
    E DOUBLE PRECISION NOT NULL,
    I DOUBLE PRECISION NOT NULL,
    user_id INTEGER NOT NULL REFERENCES user(id) ON DELETE CASCADE
);

CREATE TABLE support (
    id SERIAL PRIMARY KEY,
    type VARCHAR(10) NOT NULL CHECK (type IN ('PINNED', 'FIXED', 'ROLLER')),
    position DOUBLE PRECISION NOT NULL CHECK (position >= 0),
    beam_id INTEGER NOT NULL REFERENCES beam(id) ON DELETE CASCADE
);

CREATE TABLE point_load (
    id SERIAL PRIMARY KEY,
    magnitude DOUBLE PRECISION NOT NULL,
    position DOUBLE PRECISION NOT NULL CHECK (position >= 0),
    beam_id INTEGER NOT NULL REFERENCES beam(id) ON DELETE CASCADE
);

CREATE TABLE point_moment (
    id SERIAL PRIMARY KEY,
    magnitude DOUBLE PRECISION NOT NULL,
    position DOUBLE PRECISION NOT NULL CHECK (position >= 0),
    beam_id INTEGER NOT NULL REFERENCES beam(id) ON DELETE CASCADE
);

CREATE TABLE distributed_load (
    id SERIAL PRIMARY KEY,
    start_magnitude DOUBLE PRECISION NOT NULL,
    end_magnitude DOUBLE PRECISION NOT NULL,
    start_position DOUBLE PRECISION NOT NULL CHECK (start_position >= 0),
    end_position DOUBLE PRECISION NOT NULL CHECK (end_position >= start_position),
    beam_id INTEGER NOT NULL REFERENCES beam(id) ON DELETE CASCADE
);
