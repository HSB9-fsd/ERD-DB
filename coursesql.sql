CREATE DATABASE Course;
USE Course;

CREATE TABLE Clasess (
    id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(255) NOT NULL
);

CREATE TABLE LearningModes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES Clasess(id)
);

CREATE TABLE Subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    thumbnail VARCHAR(255) NOT NULL,
    learning_mode_id INT,
    FOREIGN KEY (learning_mode_id) REFERENCES LearningModes(id)
);

CREATE TABLE Chapter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    thumbnail VARCHAR(255) NOT NULL,
    freeXSubChapterLabel INT NOT NULL,
    ProggressionBar INT NOT NULL,
    subject_id INT,
    FOREIGN KEY (subject_id) REFERENCES Subjects(id)
);

CREATE TABLE SubChapter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    thumbnail VARCHAR(255) NOT NULL,
    FreeLabel BOOLEAN,
    ProggressionBar INT NOT NULL,
    chapter_id INT,
    FOREIGN KEY (chapter_id) REFERENCES Chapter(id)
);

CREATE TABLE Materials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255),
    thumbnail VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    exp INT,
    gold INT,
    Checklist BOOLEAN,
    subchapter_id INT,
    FOREIGN KEY (subchapter_id) REFERENCES SubChapter(id)
);

INSERT INTO Clasess (class_name) VALUES
('Kelas 1'), ('Kelas 2'), ('kelas 3'), ('kelas 4'), ('kelas 5'),
('kelas 6'), ('kelas 7'), ('kelas 8'), ('kelas 9'), ('kelas 10'),
('kelas 11'), ('kelas 10 SMK'), ('kelas 11 SMK'), ('kelas 12 SMK'),
('UTBK & Ujian Mandiri'), ('Pelatihan Guru');

INSERT INTO LearningModes (name, class_id) VALUES
('Pembelajaran Tematik', 1), ('Pembelajaran Menurut Topik', 2), ('Kurikulum Merdeka', 3);

INSERT INTO Subjects (name, thumbnail, learning_mode_id) VALUES
('Matematika', 'Matematika', 1), ('Bahasa Indonesia', 'Bahasa Indonesia', 2),
('IPA Terpadu', 'IPA Terpadu', 1), ('Pendidikan Karakter', 'Pendidikan Karakter', 2),
('Ruang Ngaji', 'Ruang Ngaji', 3);
