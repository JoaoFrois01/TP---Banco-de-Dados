###Elaborar consultas SQL com as seguintes caracterísƟcas (cada consulta deverá incluir, no mínimo, 3 tabelas)

###Duas consultas envolvendo operações de junção (JOIN);

###Consulta 1 – Listar todas as turmas com seus professores e disciplinas.
    ###Traz todas as turmas relacionando informações de 4 tabelas: Turma, Disciplina, Professor e Horário.
    SELECT 
    t.codigo_turma,
    d.nome AS disciplina,
    p.nome AS professor,
    h.dia_semana,
    h.hora,
    h.turno
FROM Turma t
JOIN Disciplina d ON t.id_disciplina = d.id_disciplina
JOIN Professor p ON t.id_professor = p.id_professor
JOIN Horario h ON t.hora = h.hora 
    AND t.dia_semana = h.dia_semana
    AND t.turno = h.turno;

###Consulta 2 – Disciplinas por curso com período (Composta)
    ###Mostra as disciplinas que pertencem a cada curso e o semestre correspondente, unindo Curso, Composta e Disciplina.
    SELECT 
    c.nome AS curso,
    d.nome AS disciplina,
    comp.semestre
FROM Curso c
JOIN Composta comp ON c.id_curso = comp.id_curso
JOIN Disciplina d ON comp.id_disciplina = d.id_disciplina
ORDER BY c.nome, comp.semestre;

___________________________________________________________________________________________________________________________________________________________________________________________________________________
###Três consultas envolvendo operações de conjuntos (união, interseção e diferença).

###Consulta 1 – UNION
    ###Combina Professores e alunos com e-mail, mais disciplina vinculada, retornando nomes e e-mails sem duplicações.
   SELECT p.nome, p.email, d.nome AS departamento_ou_disciplina
FROM Professor p
JOIN Departamento d ON p.id_departamento = d.id_departamento

UNION

SELECT a.nome, a.email, dis.nome AS departamento_ou_disciplina
FROM Aluno a
JOIN Matricula_Turma mt ON a.matricula = mt.matricula
JOIN Turma t ON mt.codigo_turma = t.codigo_turma
JOIN Disciplina dis ON t.id_disciplina = dis.id_disciplina;

###Consulta 2 – INTERSECT
    ###Retorna pessoas com nomes que aparecem em Professor, Aluno e Departamento
     SELECT p.nome
FROM Professor p
JOIN Departamento d ON p.id_departamento = d.id_departamento

INTERSECT

SELECT a.nome
FROM Aluno a
JOIN Matricula_Turma mt ON a.matricula = mt.matricula
JOIN Turma t ON mt.codigo_turma = t.codigo_turma;

###Consulta 3 - (EXCEPT)
    ###Disciplinas existentes EXCETO as ofertadas em Turma.
    SELECT d.nome
FROM Disciplina d
JOIN Composta c ON d.id_disciplina = c.id_disciplina
JOIN Curso cu ON cu.id_curso = c.id_curso

EXCEPT

SELECT d2.nome
FROM Disciplina d2
JOIN Turma t ON d2.id_disciplina = t.id_disciplina
JOIN Horario h ON t.hora = h.hora 
               AND t.dia_semana = h.dia_semana
               AND t.turno = h.turno;

____________________________________________________________________________________________________________________________________________________________________________________________________________________
###Quatro consultas envolvendo operações de agregação (SUM, COUNT, MAX, MIN, AVG), pelo menos duas das consultas devem envolver as cláusulas GROUP BY e HAVING

###Consulta 1 — COUNT
    ###Quantidade de turmas por professor (Professor + Turma + Disciplina)
    SELECT 
    p.nome AS professor,
    COUNT(t.codigo_turma) AS total_turmas
FROM Professor p
JOIN Turma t ON p.id_professor = t.id_professor
JOIN Disciplina d ON t.id_disciplina = d.id_disciplina
GROUP BY p.nome;

###Consulta 2 - MAX e MIN
    ###Maior e menor carga horária de disciplinas por curso (Curso + Composta + Disciplina)
   SELECT
    c.nome AS curso,
    MAX(d.carga_horaria) AS maior_ch,
    MIN(d.carga_horaria) AS menor_ch
FROM Curso c
JOIN Composta comp ON c.id_curso = comp.id_curso
JOIN Disciplina d ON comp.id_disciplina = d.id_disciplina
GROUP BY c.nome;

###Consulta 3 - AVG
    ###Média da carga horária por curso (Curso + Composta + Disciplina)
    SELECT 
    c.nome AS curso,
    AVG(d.carga_horaria) AS media_ch
FROM Curso c
JOIN Composta comp ON c.id_curso = comp.id_curso
JOIN Disciplina d ON comp.id_disciplina = d.id_disciplina
GROUP BY c.nome;

###Consulta 4 - SUM + HAVING
    ###Total de carga horária de cada professor somando todas as disciplinas que ele ministra (Professor + Turma + Disciplina)
    SELECT
    p.nome AS professor,
    SUM(d.carga_horaria) AS carga_total
FROM Professor p
JOIN Turma t ON p.id_professor = t.id_professor
JOIN Disciplina d ON t.id_disciplina = d.id_disciplina
GROUP BY p.nome
HAVING SUM(d.carga_horaria) > 100;

__________________________________________________________________________________________________________________________________________________________________________________________________________________
###Três consultas envolvendo os operadores LIKE, BETWEEN e IN

###Consulta 1 (LIKE) — Professores com e-mail institucional + departamento + turmas
    SELECT 
    p.nome,
    p.email,
    d.sigla AS departamento,
    t.codigo_turma
FROM Professor p
JOIN Departamento d ON p.id_departamento = d.id_departamento
LEFT JOIN Turma t ON p.id_professor = t.id_professor
WHERE p.email LIKE '%@pucminas.br';

###Consulta 2 (BETWEEN) — Turmas 2020–2025 com disciplina e professor
    SELECT 
    t.codigo_turma,
    t.ano,
    d.nome AS disciplina,
    p.nome AS professor
FROM Turma t
JOIN Disciplina d ON t.id_disciplina = d.id_disciplina
JOIN Professor p ON t.id_professor = p.id_professor
WHERE t.ano BETWEEN 2020 AND 2025;

###Consulta 3 (IN) — Alunos matriculados em turmas específicas com disciplina
    SELECT 
    a.nome AS aluno,
    mt.codigo_turma,
    d.nome AS disciplina
FROM Aluno a
JOIN Matricula_Turma mt ON a.matricula = mt.matricula
JOIN Turma t ON mt.codigo_turma = t.codigo_turma
JOIN Disciplina d ON t.id_disciplina = d.id_disciplina
WHERE mt.codigo_turma IN ('ADS101', 'ADS205', 'ADS307');

________________________________________________________________________________________________________________________________________________________________________________________________________________

###Criar duas visões, cada uma envolvendo pelo menos três tabelas

###VIEW 1 — Matrículas completas (Aluno + Matrícula_Turma + Turma + Disciplina + Professor)
    CREATE VIEW vw_matriculas AS
SELECT 
    a.nome AS aluno,
    t.codigo_turma,
    d.nome AS disciplina,
    p.nome AS professor
FROM Aluno a
JOIN Matricula_Turma mt ON a.matricula = mt.matricula
JOIN Turma t ON mt.codigo_turma = t.codigo_turma
JOIN Disciplina d ON t.id_disciplina = d.id_disciplina
JOIN Professor p ON t.id_professor = p.id_professor;

###VIEW 2 — Alocação completa (Turma + Disciplina + Alocacao + Horario)
    CREATE VIEW vw_alocacoes AS
SELECT 
    t.codigo_turma,
    d.nome AS disciplina,
    a.sala,
    h.dia_semana,
    h.hora,
    h.turno
FROM Turma t
JOIN Disciplina d ON t.id_disciplina = d.id_disciplina
JOIN Alocacao a 
     ON t.hora = a.hora 
    AND t.dia_semana = a.dia_semana
    AND t.turno = a.turno
JOIN Horario h 
     ON a.hora = h.hora 
    AND a.dia_semana = h.dia_semana
    AND a.turno = h.turno;

