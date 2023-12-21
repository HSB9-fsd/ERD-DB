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


-- Menyisipkan data ke dalam tabel Clasess
INSERT INTO Clasess (class_name) VALUES
('Kelas 1'), ('Kelas 2'), ('kelas 3'), ('kelas 4'), ('kelas 5'),
('kelas 6'), ('kelas 7'), ('kelas 8'), ('kelas 9'), ('kelas 10'),
('kelas 11'), ('kelas 10 SMK'), ('kelas 11 SMK'), ('kelas 12 SMK'),
('UTBK & Ujian Mandiri'), ('Pelatihan Guru');


-- Menyisipkan data ke dalam tabel LearningModes
INSERT INTO LearningModes (name, class_id) VALUES
('Pembelajaran Tematik', 1), ('Pembelajaran Menurut Topik', 2), ('Kurikulum Merdeka', 3);


-- Menyisipkan data ke dalam tabel Subjects
INSERT INTO Subjects (name, thumbnail, learning_mode_id) VALUES
('Matematika', 'Matematika', 1), ('Bahasa Indonesia', 'Bahasa Indonesia', 2),
('IPA Terpadu', 'IPA Terpadu', 1), ('Pendidikan Karakter', 'Pendidikan Karakter', 2),
('Ruang Ngaji', 'Ruang Ngaji', 3);


-- Menyisipkan data ke dalam tabel Chapter
INSERT INTO Chapter (name, thumbnail, freeXSubChapterLabel, ProggressionBar, subject_id)
VALUES
('Chapter 1', 'Thumbnail Chapter 1', 1, 50, 1),
('Chapter 2', 'Thumbnail Chapter 2', 0, 75, 2),
('Chapter 3', 'Thumbnail Chapter 3', 1, 60, 1),
('Chapter 4', 'Thumbnail Chapter 4', 0, 80, 3),
('Chapter 5', 'Thumbnail Chapter 5', 1, 70, 2);

-- Menyisipkan data ke dalam tabel SubChapter
INSERT INTO SubChapter (name, thumbnail, FreeLabel, ProggressionBar, chapter_id)
VALUES
('SubChapter 1', 'Thumbnail SubChapter 1', true, 50, 1),
('SubChapter 2', 'Thumbnail SubChapter 2', false, 75, 2),
('SubChapter 3', 'Thumbnail SubChapter 3', true, 60, 1),
('SubChapter 4', 'Thumbnail SubChapter 4', false, 80, 3),
('SubChapter 5', 'Thumbnail SubChapter 5', true, 70, 2);


-- Menyisipkan data ke dalam tabel Materials
INSERT INTO Materials (type, thumbnail, name, exp, gold, Checklist, subchapter_id)
VALUES
('Type A', 'Thumbnail A', 'Material A', 100, 50, true, 1),
('Type B', 'Thumbnail B', 'Material B', 150, 75, false, 2),
('Type C', 'Thumbnail C', 'Material C', 120, 60, true, 1),
('Type D', 'Thumbnail D', 'Material D', 200, 80, false, 3),
('Type E', 'Thumbnail E', 'Material E', 180, 70, true, 2);

-- POINT A
SELECT * FROM Clasess c
SELECT * FROM LearningModes l

-- Menampilkan data dari kedua tabel dengan bergabung
SELECT Clasess.class_name, LearningModes.name
FROM Clasess
JOIN LearningModes ON Clasess.id = LearningModes.class_id;


-- POIN B 
SELECT * FROM Subjects s


-- POINT C
SELECT * FROM Chapter c


-- POINT D
SELECT id, name, FreeLabel, ProggressionBar
FROM SubChapter;

-- POINT E

-- Mengambil data dari tabel Materials
SELECT id, type, thumbnail, name, exp, gold, Checklist, subchapter_id
FROM Materials;
