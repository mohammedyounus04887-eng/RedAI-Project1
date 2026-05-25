CREATE TABLE centers (
    id SERIAL PRIMARY KEY,
    center_name VARCHAR(100),
    address TEXT,
    city VARCHAR(100)
);

CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    center_id INT REFERENCES centers(id),
    room_name VARCHAR(100),
    capacity INT
);

CREATE TABLE equipment (
    id SERIAL PRIMARY KEY,
    room_id INT REFERENCES rooms(id),
    equipment_name VARCHAR(100),
    status VARCHAR(50) DEFAULT 'available'
);

CREATE TABLE trainers (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    specialization VARCHAR(100),
    experience_years INT
);

CREATE TABLE batches (
    id SERIAL PRIMARY KEY,
    batch_name VARCHAR(100),
    course_name VARCHAR(100),
    center_id INT REFERENCES centers(id),
    start_date DATE,
    end_date DATE,
    status VARCHAR(50) DEFAULT 'planned'
);

CREATE TABLE batch_sessions (
    id SERIAL PRIMARY KEY,
    batch_id INT REFERENCES batches(id),
    room_id INT REFERENCES rooms(id),
    session_date DATE,
    start_time TIME,
    end_time TIME,
    topic VARCHAR(150)
);
