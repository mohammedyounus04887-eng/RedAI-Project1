CREATE TABLE fee_plans (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100),
    total_fee DECIMAL(10,2),
    duration_months INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE fee_installments (
    id SERIAL PRIMARY KEY,
    enrollment_id INT REFERENCES enrollments(id),
    amount DECIMAL(10,2),
    due_date DATE,
    status VARCHAR(50) DEFAULT 'pending'
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    installment_id INT REFERENCES fee_installments(id),
    amount_paid DECIMAL(10,2),
    payment_mode VARCHAR(50),
    transaction_id VARCHAR(100),
    paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE receipts (
    id SERIAL PRIMARY KEY,
    payment_id INT REFERENCES payments(id),
    receipt_number VARCHAR(100) UNIQUE,
    receipt_url TEXT,
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE scholarships (
    id SERIAL PRIMARY KEY,
    enrollment_id INT REFERENCES enrollments(id),
    scholarship_name VARCHAR(100),
    discount_amount DECIMAL(10,2),
    approved_by INT REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    enrollment_id INT REFERENCES enrollments(id),
    invoice_number VARCHAR(100) UNIQUE,
    total_amount DECIMAL(10,2),
    status VARCHAR(50) DEFAULT 'unpaid',
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
