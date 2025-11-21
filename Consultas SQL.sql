### Elaborar consultas SQL com as seguintes características (cada consulta deverá incluir, no mínimo, 3 tabelas)  

### Duas consultas envolvendo operações de junção.

### Consulta 1: Listar Disciplinas por Curso e seu Professor Coordenador esta consulta recupera o nome de todas as Disciplinas de um curso específico, o nome do Curso ao qual elas pertencem, e o nome do Professor que coordena esse curso.
### Perguntas Respondidas: Quais disciplinas pertencem ao curso 'Sistemas de Informação' e quem o coordena? (Assumindo um curso com id_curso = 101)

SELECT
    C.nome AS Nome_Curso,
    P.nome AS Nome_Coordenador,
    D.nome AS Nome_Disciplina
FROM
    Curso C 
JOIN
    Professor P ON C.coordenador = P.id_professor 
JOIN
    Disciplina D ON C.id_curso = D.id_curso
WHERE
    C.id_curso = 101; 

### Consulta 2: Listar Alunos e suas Notas de Avaliação em uma Turma esta consulta lista o nome e a matrícula de todos os Alunos que estão cursando um determinado Semestre, e os relaciona às suas Avaliações registradas em uma Turma específica.
### Perguntas Respondidas: Quais alunos e suas matrículas do Semestre '2024/2' têm avaliações registradas na Turma 'BD-2024'? (Assumindo numero_semestre = '2024/2' e codigo_turma = 'BD-2024')

SELECT
    A.matricula AS Matricula_Aluno,
    A.nome AS Nome_Aluno,
    S.descricao AS Semestre,
    T.codigo_turma AS Codigo_Turma,
    V.tipo AS Tipo_Avaliacao,
    V.data AS Data_Avaliacao
FROM
    Aluno A 
JOIN
    Cursa_Semestre CS ON A.matricula = CS.matricula 
JOIN
    Semestre S ON CS.numero_semestre = S.numero_semestre 
JOIN
    Turma T ON T.numero_semestre = S.numero_semestre 
LEFT JOIN
    Avaliacao V ON T.codigo_turma = V.codigo_turma AND V.matricula_aluno = A.matricula 
WHERE
    S.numero_semestre = '2024/2'
    AND T.codigo_turma = 'BD-2024';

### Três consultas envolvendo operações de conjuntos (união, interseção e diferença).
### União
### Esta consulta lista o nome e o email de todos os indivíduos que são Professores OU Alunos e que estão alocados/cursando o Semestre '2025/1' de alguma forma.
### Lógica: Combina professores de uma turma do semestre com alunos que cursam o mesmo semestre.


SELECT
    P.nome AS Nome,
    P.email AS Email,
    'Professor' AS Tipo_Individuo
FROM
    Professor P
JOIN
    Ministra M ON P.id_professor = M.id_professor 
JOIN
    Turma T ON M.codigo_turma = T.codigo_turma AND M.ano = T.ano 
WHERE
    T.numero_semestre = '2025/1' 
UNION

SELECT
    A.nome AS Nome,
    A.email AS Email,
    'Aluno' AS Tipo_Individuo
FROM
    Aluno A
JOIN
    Cursa_Semestre CS ON A.matricula = CS.matricula 
JOIN
    Semestre S ON CS.numero_semestre = S.numero_semestre 
WHERE
    S.numero_semestre = '2025/1';


### Interseção 
### Esta consulta lista o nome e o email dos Professores que ministram alguma Turma e ao mesmo tempo, são Coordenadores de algum Curso.
### Lógica: Encontra os professores que têm o papel de docente e o papel de gestão coordenador.


SELECT
    P.nome AS Nome,
    P.email AS Email
FROM
    Professor P 
JOIN
    Ministra M ON P.id_professor = M.id_professor 
JOIN
    Turma T ON M.codigo_turma = T.codigo_turma AND M.ano = T.ano 
INTERSECT
SELECT
    P.nome AS Nome,
    P.email AS Email
FROM
    Professor P 
JOIN
    Curso C ON P.id_professor = C.coordenador 
JOIN
    Departamento D ON C.id_departamento = D.id_departamento 


### Diferença (EXCEPT / MINUS) esta consulta lista o nome e o email dos professores que pertencem a um Departamento 
### específico (ex: 'Departamento de Computação', id_departamento = 50) MAS que não ministram nenhuma Turma.


SELECT
    P.nome AS Nome,
    P.email AS Email
FROM
    Professor P
JOIN
    Departamento D ON P.id_departamento = D.id_departamento
JOIN
    Curso C ON D.id_departamento = C.id_departamento 
WHERE
    P.id_departamento = 50

EXCEPT

SELECT
    P.nome AS Nome,
    P.email AS Email
FROM
    Professor P 
JOIN
    Ministra M ON P.id_professor = M.id_professor
JOIN
    Disciplina DS ON DS.id_disciplina = M.id_disciplina 



### Três consultas envolvendo os operadores LIKE, BETWEEN e IN.
### Uso do LIKE: Pesquisa por Nome e Departamento,esta consulta lista o nome, email e departamento de todos os 
### professores cujo nome começa com a letra 'A' e que estão alocados em um Departamento cuja sigla contenha a substring 'INF'.

    
  SELECT
    P.nome AS Nome_Professor,
    P.email AS Email_Professor,
    D.nome AS Nome_Departamento,
    D.sigla AS Sigla_Departamento
FROM
    Professor P 
JOIN
    Departamento D ON P.id_departamento = D.id_departamento 
JOIN
    Turma T ON P.id_professor = T.id_professor_ministrante 
WHERE
    P.nome LIKE 'A%' 
    AND D.sigla LIKE '%INF%'; 


### Uso do BETWEEN: Avaliações em um Período Específico esta consulta retorna o Tipo e a Data das Avaliações 
### realizadas em uma determinada Turma, dentro de um intervalo de datas (entre '2025-03-01' e '2025-03-31'), 
### e o nome da Disciplina associada à turma.

    
SELECT
    V.tipo AS Tipo_Avaliacao,
    V.data AS Data_Avaliacao,
    T.codigo_turma AS Codigo_Turma,
    D.nome AS Nome_Disciplina
FROM
    Avaliacao V 
JOIN
    Turma T ON V.codigo_turma = T.codigo_turma AND V.ano = T.ano 
JOIN
    Disciplina D ON T.id_disciplina = D.id_disciplina 
WHERE
    V.data BETWEEN '2025-03-01' AND '2025-03-31' 
    AND T.codigo_turma = 'BDOO-T01';


### Uso do IN: Filtro por Múltiplas Localidades esta consulta lista a Matrícula e o Nome dos Alunos que estão matriculados 
### em um Curso cuja Modalidade é 'Presencial' OU 'EAD' e cujo Departamento responsável está entre uma lista de 
### IDs específicos (10, 20, 30).

    
SELECT
    A.matricula AS Matricula_Aluno,
    A.nome AS Nome_Aluno,
    C.nome AS Nome_Curso,
    C.modalidade AS Modalidade_Curso
FROM
    Aluno A
JOIN
    Cursa_Curso CC ON A.matricula = CC.matricula
JOIN
    Curso C ON CC.id_curso = C.id_curso 
JOIN
    Departamento D ON C.id_departamento = D.id_departamento 
WHERE
    C.modalidade IN ('Presencial', 'EAD') 
    AND D.id_departamento IN (10, 20, 30);
