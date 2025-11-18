/* Lógico_1: */

CREATE TABLE Professor (
    id_professor INT PRIMARY KEY,
    nome VARCHAR,
    email VARCHAR,
    fk_Departamento_id_departamento INT
);

CREATE TABLE Disciplina (
    nome VARCHAR,
    carga_horaria INT,
    id_disciplina INT PRIMARY KEY
);

CREATE TABLE Horario (
    dia_semana VARCHAR,
    turno VARCHAR,
    hora VARCHAR
);

CREATE TABLE Alocacao (
    id_alocacao INT PRIMARY KEY,
    sala VARCHAR
);

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY,
    nome VARCHAR,
    modalidade VARCHAR,
    coordenador VARCHAR
);

CREATE TABLE Aluno (
    matricula INT PRIMARY KEY,
    nome VARCHAR,
    email VARCHAR
);

CREATE TABLE Turma (
    codigo_turma INT PRIMARY KEY,
    ano VARCHAR
);

CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY,
    nome VARCHAR,
    sigla VARCHAR
);

CREATE TABLE Avaliacao (
    id_avaliacao INT PRIMARY KEY,
    data DATE,
    tipo VARCHAR
);

CREATE TABLE Composta (
    fk_Curso_id_curso INT,
    fk_Disciplina_id_disciplina INT,
    semestre VARCHAR
);

CREATE TABLE Ministra (
    fk_Turma_codigo_turma INT,
    fk_Professor_id_professor INT
);

CREATE TABLE Tem (
    fk_Turma_codigo_turma INT,
    fk_Disciplina_id_disciplina INT
);

CREATE TABLE Avalia (
    fk_Turma_codigo_turma INT,
    fk_Avaliacao_id_avaliacao INT
);

CREATE TABLE Esta_matriculado (
    fk_Turma_codigo_turma INT,
    fk_Aluno_matricula INT
);

CREATE TABLE Esta_Alocada (
    fk_Turma_codigo_turma INT
);
 
ALTER TABLE Professor ADD CONSTRAINT FK_Professor_2
    FOREIGN KEY (fk_Departamento_id_departamento)
    REFERENCES Departamento (id_departamento)
    ON DELETE CASCADE;
 
ALTER TABLE Composta ADD CONSTRAINT FK_Composta_1
    FOREIGN KEY (fk_Curso_id_curso)
    REFERENCES Curso (id_curso)
    ON DELETE RESTRICT;
 
ALTER TABLE Composta ADD CONSTRAINT FK_Composta_2
    FOREIGN KEY (fk_Disciplina_id_disciplina)
    REFERENCES Disciplina (id_disciplina)
    ON DELETE RESTRICT;
 
ALTER TABLE Ministra ADD CONSTRAINT FK_Ministra_1
    FOREIGN KEY (fk_Turma_codigo_turma)
    REFERENCES Turma (codigo_turma)
    ON DELETE SET NULL;
 
ALTER TABLE Ministra ADD CONSTRAINT FK_Ministra_2
    FOREIGN KEY (fk_Professor_id_professor)
    REFERENCES Professor (id_professor)
    ON DELETE SET NULL;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_1
    FOREIGN KEY (fk_Turma_codigo_turma)
    REFERENCES Turma (codigo_turma)
    ON DELETE RESTRICT;
 
ALTER TABLE Tem ADD CONSTRAINT FK_Tem_2
    FOREIGN KEY (fk_Disciplina_id_disciplina)
    REFERENCES Disciplina (id_disciplina)
    ON DELETE RESTRICT;
 
ALTER TABLE Avalia ADD CONSTRAINT FK_Avalia_1
    FOREIGN KEY (fk_Turma_codigo_turma)
    REFERENCES Turma (codigo_turma)
    ON DELETE RESTRICT;
 
ALTER TABLE Avalia ADD CONSTRAINT FK_Avalia_2
    FOREIGN KEY (fk_Avaliacao_id_avaliacao)
    REFERENCES Avaliacao (id_avaliacao)
    ON DELETE RESTRICT;
 
ALTER TABLE Esta_matriculado ADD CONSTRAINT FK_Esta_matriculado_1
    FOREIGN KEY (fk_Turma_codigo_turma)
    REFERENCES Turma (codigo_turma)
    ON DELETE SET NULL;
 
ALTER TABLE Esta_matriculado ADD CONSTRAINT FK_Esta_matriculado_2
    FOREIGN KEY (fk_Aluno_matricula)
    REFERENCES Aluno (matricula)
    ON DELETE SET NULL;
 
ALTER TABLE Esta_Alocada ADD CONSTRAINT FK_Esta_Alocada_1
    FOREIGN KEY (fk_Turma_codigo_turma)
    REFERENCES Turma (codigo_turma)
    ON DELETE SET NULL;