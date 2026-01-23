ALTER TABLE competency_type
    MODIFY COLUMN category ENUM(
    '협업_커뮤니케이션_역량',
    '문제해결_사고_역량',
    '실행_성장_역량'
    ) NOT NULL;