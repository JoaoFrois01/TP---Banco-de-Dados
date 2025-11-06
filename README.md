TP - Banco de Dados
---
Integrantes:
* João Victor Fróis da Fonseca
* Júlia Maria Ferreira
* Pedro Barroso Dias de Lima
* Thiago Alexandre de Lelis Alves Gomes

---

## Orientações para desenvolvimento do trabalho:


## 📌 1. Tema

Especificação e implementação de um **Sistema de Gestão de Horários de Disciplinas** para o curso de Tecnologia em Análise e Desenvolvimento de Sistemas (ADS) da PUC Minas.

---

## 🎯 2. Objetivo Geral

Realizar a **especificação** e **implementação de funcionalidades** de um Sistema de Gestão de Horários de Disciplinas. O foco principal é a **Alocação de Horários**, buscando maximizar o número de disciplinas em paralelo, respeitando as seguintes restrições:

* Disciplinas do **mesmo período** não podem ser alocadas para o mesmo horário.
* Uma disciplina só pode ser ministrada por **um professor**.
* Considerar que, por dia, podemos ter **2 horários** de alocação.
* Professores podem ministrar diversas disciplinas.

### 2.1. Entregáveis do Projeto

Ao final do trabalho, deve ser entregue:

* **Documento Detalhado:** Introdução, objetivos, descrição do problema, solução adotada (modelagem e resolução), descrição do algoritmo (incluindo pseudocódigo), testes realizados e resultados, conclusão e referências (se aplicável).
* **Código Fonte** da aplicação.
* **Testes** realizados e seus resultados.

---

## ⚙️ 3. Requisitos do Sistema (TIAPN)

O grupo deverá criar e complementar os requisitos funcionais e não funcionais a partir do domínio do negócio.

### Requisitos Mínimos Obrigatórios

* O sistema deverá gerenciar o **cadastro de usuários**.
* O sistema deverá realizar a **autenticação de usuários** (não é necessária implementação de criptografia).

### 3.1. Objetivos Específicos

* Aplicar conceitos de modelagem de **Casos de Uso** ou **Histórias de Usuários** para levantamento de requisitos.
* Identificar **Requisitos Funcionais** e **Não Funcionais**.
* Aplicar a **Modelagem de Classes**, detalhando atributos e métodos.

---

## 💾 4. Considerações para a Disciplina Banco de Dados (BD)

### 4.1. Objetivo Geral (BD)

Fazer a **modelagem do banco de dados** e a **implementação de três funcionalidades** que envolvam manipulação de dados para o sistema de gestão de horários.

> **OBS:** O esquema relacional resultante deve gerar, **no mínimo, 10 tabelas**.

### 4.2. Objetivos Específicos (BD)

* Aplicar conceitos de **Modelagem Conceitual** de bancos de dados.
* Fazer o mapeamento para os modelos **Lógico** e **Físico**.
* Implementar os modelos em um **SGBD** e fazer a **conexão da aplicação** com o banco de dados.
* Desenvolver **consultas em SQL** conforme especificação.

### 4.3. Descrição do Trabalho (BD)

#### Parte 1 – Modelagem Conceitual e Mapeamento

1.  Representar o **esquema conceitual** através do **Diagrama Entidade-Relacionamento (DER)** e do **Diagrama de Classes**.
2.  Fazer o **mapeamento** para um **esquema lógico (relacional)**, respeitando as regras de **normalização**.
3.  Escrever comandos **`CREATE TABLE`** (DDL) para o esquema relacional, incluindo chaves primárias e estrangeiras.

#### Parte 2 – Consultas em SQL

Elaborar consultas SQL com as seguintes características (cada consulta deve envolver, no mínimo, 3 tabelas):

* **Junção:** 2 consultas.
* **Operações de Conjuntos:** 3 consultas (União, Interseção e Diferença).
* **Agregação:** 4 consultas (SUM, COUNT, MAX, MIN, AVG), sendo que pelo menos 2 devem usar `GROUP BY` e `HAVING`.
* **Operadores:** 3 consultas envolvendo `LIKE`, `BETWEEN` e `IN`.
* **Visões (Views):** Criar 2 visões, cada uma envolvendo pelo menos 3 tabelas.

#### Parte 3 – Implementação da Aplicação (Funcionalidades)

5.  Desenvolver uma **interface para entrada de dados** (Web: Java, PHP, Python, JavaScript, etc).
6.  Implementar **pelo menos 3 funcionalidades** da aplicação.
7.  Implementar regras de validação no código da aplicação ou no SGBD (`triggers` ou `stored procedures`).

### 5.4. Detalhamento das Entregas e Prazos

| Item de Entrega | Prazo |
| :--- | :--- |
| Diagrama Entidade-Relacionamento (DER) e Diagrama de Classes | **12/11/2025** |
| Mapeamento para o Modelo Lógico (Relacional) | **12/11/2025** |
| Mapeamento para o Modelo Físico (Scripts de DDL) | **12/11/2025** |
| Consultas em SQL (código e explicação) | **26/11/2025** |
| Implementação da Aplicação | **10/12/2025** |

---

## ⭐️ 5. Critérios de Avaliação

* **Apresentação:** Todos os trabalhos serão apresentados pelos integrantes do grupo no dia **10/12/2025**.
* **Qualidade:** Avaliação da qualidade da **documentação (modelagem)** e da **implementação do código**.
* **Nota Individual:** A nota é individual, baseada na participação do aluno na execução e apresentação do trabalho no grupo.

---

## 📝 6. Demais Considerações

* **Grupo:** O trabalho deve ser desenvolvido em grupos de, no máximo, **5 alunos**.
* **Entrega:** Os documentos devem ser entregues no Canvas, em formato **`.pdf`** ou **`.zip`**.

---
