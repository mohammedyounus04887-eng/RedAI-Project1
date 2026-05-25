CREATE TABLE learner_profiles (
    id SERIAL PRIMARY KEY,
    enrollment_id INT REFERENCES enrollments(id),
    batch_id INT REFERENCES batches(id),
    learning_status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE progress (
    id SERIAL PRIMARY KEY,
    learner_id INT REFERENCES learner_profiles(id),
    module_name VARCHAR(100),
    completion_percentage INT DEFAULT 0,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE attendance (
    id SERIAL PRIMARY KEY,
    learner_id INT REFERENCES learner_profiles(id),
    session_id INT REFERENCES batch_sessions(id),
    status VARCHAR(20),
    marked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    batch_id INT REFERENCES batches(id),
    project_title VARCHAR(150),
    description TEXT,
    due_date DATE
);

CREATE TABLE submissions (
    id SERIAL PRIMARY KEY,
    project_id INT REFERENCES projects(id),
    learner_id INT REFERENCES learner_profiles(id),
    submission_url TEXT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    grade VARCHAR(20)
);

CREATE TABLE feedback (
    id SERIAL PRIMARY KEY,
    learner_id INT REFERENCES learner_profiles(id),
    trainer_id INT REFERENCES trainers(id),
    comments TEXT,
    rating INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
