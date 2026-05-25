CREATE TABLE applications (
    id SERIAL PRIMARY KEY,
    lead_id INT REFERENCES leads(id),
    applicant_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    course_applied VARCHAR(100),
    status VARCHAR(50) DEFAULT 'submitted',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE application_documents (
    id SERIAL PRIMARY KEY,
    application_id INT REFERENCES applications(id),
    document_type VARCHAR(100),
    document_url TEXT,
    verified BOOLEAN DEFAULT FALSE,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE offers (
    id SERIAL PRIMARY KEY,
    application_id INT REFERENCES applications(id),
    offer_status VARCHAR(50) DEFAULT 'pending',
    offered_course VARCHAR(100),
    offer_date DATE,
    expiry_date DATE
);

CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    offer_id INT REFERENCES offers(id),
    student_user_id INT REFERENCES users(id),
    enrollment_date DATE,
    status VARCHAR(50) DEFAULT 'active'
);
