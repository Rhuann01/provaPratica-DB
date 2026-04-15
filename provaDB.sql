-- MODELAGEM DO BANCO
CREATE TABLE Aluno (
id_aluno INT PRIMARY KEY,
nome VARCHAR(100),
matricula_cod VARCHAR(20) UNIQUE
);

CREATE TABLE Professor (
id_professor INT PRIMARY KEY,
nome VARCHAR(100)
);

CREATE TABLE Turma (
id_turma INT PRIMARY KEY,
periodo_letivo VARCHAR(10),
codigo_turma VARCHAR(20)
);

CREATE TABLE Disciplina (
id_disciplina INT PRIMARY KEY,
nome_disciplina VARCHAR(100),
id_professor INT,
id_turma INT,
FOREIGN KEY (id_professor) REFERENCES Professor(id_professor),
FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);

CREATE TABLE Matricula (
id_aluno INT,
id_disciplina INT,
nota_final DECIMAL(4,2),
PRIMARY KEY (id_aluno, id_disciplina),
FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);

-- INSERTS
INSERT INTO Aluno (id_aluno, nome, matricula_cod) VALUES
(1, 'João Silva', 'MAT001'),
(2, 'Maria Santos', 'MAT002'),
(3, 'Pedro Oliveira', 'MAT003'),
(4, 'Ana Costa', 'MAT004');

INSERT INTO Professor (id_professor, nome) VALUES
(101, 'Dr. Carlos Mendez'),
(102, 'Dra. Patricia Gomes'),
(103, 'Prof. Roberto Alves');

INSERT INTO Turma (id_turma, periodo_letivo, codigo_turma) VALUES
(1, '2026.1', 'TURMA-A'),
(2, '2026.1', 'TURMA-B');

INSERT INTO Disciplina (id_disciplina, nome_disciplina, id_professor, id_turma) VALUES
(201, 'Matemática', 101, 1),
(202, 'Português', 102, 1),
(203, 'História', 103, 2),
(204, 'Inglês', 101, 2);

INSERT INTO Matricula (id_aluno, id_disciplina, nota_final) VALUES
(1, 201, 8.50),
(1, 202, 7.80),
(2, 201, 9.20),
(2, 203, 8.90),
(3, 202, 7.50),
(3, 204, 8.60),
(4, 203, 9.00),
(4, 204, 8.20);

-- CONSULTA
SELECT
A.nome AS Aluno,
D.nome_disciplina AS Disciplina,
P.nome AS Professor_Responsavel,
M.nota_final AS Desempenho
FROM Aluno A
JOIN Matricula M ON A.id_aluno = M.id_aluno
JOIN Disciplina D ON M.id_disciplina = D.id_disciplina
JOIN Professor P ON D.id_professor = P.id_professor;