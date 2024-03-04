-- Criação do banco de dados da universidade
CREATE DATABASE IF NOT EXISTS universidade;

USE universidade;

-- Tabelas de autenticação, usuários e grupos com permissões
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS groups (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

-- Tabela de Associação Usuário-Grupo
CREATE TABLE IF NOT EXISTS user_groups (
    user_id INT NOT NULL,
    group_id INT NOT NULL,
    PRIMARY KEY (user_id, group_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

-- Inserir grupos iniciais
INSERT INTO groups (name, description) VALUES
('root', 'Grupo root'),
('admin', 'Grupo de administradores'),
('testes', 'Grupo de testes do sistema'),
('professores', 'Grupo de professores'),
('alunos', 'Grupo de alunos');

-- Inserir usuários iniciais com senhas já hasheadas
INSERT INTO users (username, password_hash) VALUES
('root', SHA2('rootpasswd', 256)),
('test_user', SHA2('testespasswd', 256));

-- Inserir associações de usuários aos grupos
INSERT INTO user_groups (user_id, group_id)
VALUES
(
    (SELECT id FROM users WHERE username = 'root'),
    (SELECT id FROM groups WHERE name = 'root')
),
(
    (SELECT id FROM users WHERE username = 'root'),
    (SELECT id FROM groups WHERE name = 'admin')
),
(
    (SELECT id FROM users WHERE username = 'root'),
    (SELECT id FROM groups WHERE name = 'professores')
),
(
    (SELECT id FROM users WHERE username = 'root'),
    (SELECT id FROM groups WHERE name = 'alunos')
),
(
    (SELECT id FROM users WHERE username = 'root'),
    (SELECT id FROM groups WHERE name = 'testes')
),
(
    (SELECT id FROM users WHERE username = 'test_user'),
    (SELECT id FROM groups WHERE name = 'testes')
);

-- Tabela de Endereços
CREATE TABLE IF NOT EXISTS enderecos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL
) AUTO_INCREMENT = 5000;

-- Tabela de Campus
CREATE TABLE IF NOT EXISTS campus (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    cnpj CHAR(14) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    endereco_id INT NOT NULL,
    FOREIGN KEY (endereco_id) REFERENCES enderecos(id)
);

-- Tabela de Professores
CREATE TABLE IF NOT EXISTS professores (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    rg VARCHAR(12) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero VARCHAR(10) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    email_profissional VARCHAR(100) NOT NULL UNIQUE,
    email_pessoal VARCHAR(100) NOT NULL UNIQUE,
    endereco_id INT NOT NULL,
    carga_horaria VARCHAR(20),
    salario_hora DECIMAL(10, 2) NOT NULL,
    especializacao VARCHAR(50),
    campus_id INT NOT NULL,
    user_id INT NOT NULL UNIQUE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (campus_id) REFERENCES campus(id),
    FOREIGN KEY (endereco_id) REFERENCES enderecos(id)
) AUTO_INCREMENT = 10000;

-- Tabela de Cursos
CREATE TABLE IF NOT EXISTS cursos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100) NOT NULL,
    campus_id INT NOT NULL,
    coordenador_id INT NOT NULL,
    FOREIGN KEY (campus_id) REFERENCES campus(id),
    FOREIGN KEY (coordenador_id) REFERENCES professores(id)
) AUTO_INCREMENT = 1000;

-- Tabela de Turmas
CREATE TABLE IF NOT EXISTS turmas (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ano_ingresso INT NOT NULL,
    ano_formatura INT NOT NULL,
    curso_id INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
) AUTO_INCREMENT = 2000;

-- Tabela de Disciplinas
CREATE TABLE IF NOT EXISTS disciplinas (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    campus_id INT NOT NULL,
    professor_id INT NOT NULL,
    numero_vagas INT NOT NULL,
    horario TIME NOT NULL,
    FOREIGN KEY (campus_id) REFERENCES campus(id),
    FOREIGN KEY (professor_id) REFERENCES professores(id)
) AUTO_INCREMENT = 3000;

-- Tabela de Serviços
CREATE TABLE IF NOT EXISTS servicos (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_servico VARCHAR(100) NOT NULL,
    campus_id INT NOT NULL,
    FOREIGN KEY (campus_id) REFERENCES campus(id)
) AUTO_INCREMENT = 4000;

-- Tabela de Alunos
CREATE TABLE IF NOT EXISTS alunos (
    matricula INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    rg VARCHAR(12) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero VARCHAR(10) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL,
    telefone VARCHAR(20) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    endereco_id INT NOT NULL,
    curso_id INT NOT NULL,
    turma_id INT NOT NULL,
    user_id INT NOT NULL UNIQUE,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (endereco_id) REFERENCES enderecos(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id),
    FOREIGN KEY (turma_id) REFERENCES turmas(id)
) AUTO_INCREMENT = 20000;

-- Tabela de Matrículas
CREATE TABLE matriculas (
    aluno_id INT NOT NULL,
    disciplina_id INT NOT NULL,
    PRIMARY KEY (aluno_id, disciplina_id),
    FOREIGN KEY (aluno_id) REFERENCES alunos(matricula),
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id)
);
