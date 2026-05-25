CREATE TABLE inquiries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    course_interest VARCHAR(100),
    source VARCHAR(100),
    status VARCHAR(50) DEFAULT 'new',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE leads (
    id SERIAL PRIMARY KEY,
    inquiry_id INT REFERENCES inquiries(id),
    assigned_to INT REFERENCES users(id),
    status VARCHAR(50) DEFAULT 'open',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lead_scores (
    id SERIAL PRIMARY KEY,
    lead_id INT REFERENCES leads(id),
    score INT,
    reason TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE follow_ups (
    id SERIAL PRIMARY KEY,
    lead_id INT REFERENCES leads(id),
    follow_up_date DATE,
    notes TEXT,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE counselor_assignments (
    id SERIAL PRIMARY KEY,
    counselor_id INT REFERENCES users(id),
    lead_id INT REFERENCES leads(id),
    assigned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
