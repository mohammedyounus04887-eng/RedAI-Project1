ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE inquiries ENABLE ROW LEVEL SECURITY;
ALTER TABLE leads ENABLE ROW LEVEL SECURITY;
ALTER TABLE applications ENABLE ROW LEVEL SECURITY;
ALTER TABLE enrollments ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Authenticated users can read inquiries"
ON inquiries
FOR SELECT
TO authenticated
USING (true);

CREATE POLICY "Authenticated users can insert inquiries"
ON inquiries
FOR INSERT
TO authenticated
WITH CHECK (true);
