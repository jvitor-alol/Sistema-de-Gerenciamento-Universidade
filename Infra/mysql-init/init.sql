-- Criação do banco de dados da universidade
CREATE DATABASE IF NOT EXISTS Universidade;

USE Universidade;

-- Tabelas de autenticação, usuários e grupos com permissões
CREATE TABLE IF NOT EXISTS Users (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Groups (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(255)
);

-- Tabela de Associação Usuário-Grupo
CREATE TABLE IF NOT EXISTS Groupuser (
    UserId INT NOT NULL,
    GroupId INT NOT NULL,
    PRIMARY KEY (UserId, GroupId),
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (GroupId) REFERENCES Groups(Id)
);

-- Inserir grupos iniciais
INSERT INTO Groups (Name, Description) VALUES
('root', 'Grupo root'),
('admin', 'Grupo de administradores'),
('testes', 'Grupo de testes do sistema'),
('professores', 'Grupo de professores'),
('alunos', 'Grupo de alunos');

-- Inserir usuários iniciais com senhas já hasheadas
INSERT INTO Users (Username, PasswordHash) VALUES
('root', SHA2('rootpasswd', 256)),
('test_user', SHA2('testespasswd', 256));

-- Inserir associações de usuários aos grupos
INSERT INTO Groupuser (UserID, GroupId)
VALUES
(
    (SELECT Id FROM Users WHERE Username = 'root'),
    (SELECT Id FROM Groups WHERE Name = 'root')
),
(
    (SELECT Id FROM Users WHERE Username = 'root'),
    (SELECT Id FROM Groups WHERE Name = 'admin')
),
(
    (SELECT Id FROM Users WHERE Username = 'root'),
    (SELECT Id FROM Groups WHERE Name = 'professores')
),
(
    (SELECT Id FROM Users WHERE Username = 'root'),
    (SELECT Id FROM Groups WHERE Name = 'alunos')
),
(
    (SELECT Id FROM Users WHERE Username = 'root'),
    (SELECT Id FROM Groups WHERE Name = 'testes')
),
(
    (SELECT Id FROM Users WHERE Username = 'test_user'),
    (SELECT Id FROM Groups WHERE Name = 'testes')
);

-- Tabela de Endereços
CREATE TABLE IF NOT EXISTS Enderecos (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Rua VARCHAR(100) NOT NULL,
    Numero INT NOT NULL,
    Bairro VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado CHAR(2) NOT NULL
) AUTO_INCREMENT = 5000;

-- Tabela de Campi
CREATE TABLE IF NOT EXISTS Campi (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CNPJ CHAR(14) NOT NULL UNIQUE,
    Nome VARCHAR(100) NOT NULL,
    EnderecoId INT NOT NULL,
    FOREIGN KEY (EnderecoId) REFERENCES Enderecos(Id)
) AUTO_INCREMENT = 10;

-- Tabela de Professores
CREATE TABLE IF NOT EXISTS Professores (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    RG VARCHAR(12) NOT NULL,
    DataNascimento DATE NOT NULL,
    Genero VARCHAR(10) NOT NULL,
    Nacionalidade VARCHAR(50) NOT NULL,
    Telefone VARCHAR(20) NOT NULL UNIQUE,
    EmailProfissional VARCHAR(100) NOT NULL UNIQUE,
    EmailPessoal VARCHAR(100) NOT NULL UNIQUE,
    EnderecoId INT NOT NULL,
    CargaHoraria INT,
    SalarioHora DECIMAL(10, 2) NOT NULL,
    Especializacao VARCHAR(50),
    CampusId INT NOT NULL,
    UserId INT NOT NULL UNIQUE,
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (CampusId) REFERENCES Campi(Id),
    FOREIGN KEY (EnderecoId) REFERENCES Enderecos(Id)
) AUTO_INCREMENT = 10000;

-- Tabela de Cursos
CREATE TABLE IF NOT EXISTS Cursos (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NomeCurso VARCHAR(100) NOT NULL,
    CampusId INT NOT NULL,
    CoordenadorId INT NOT NULL,
    FOREIGN KEY (CampusId) REFERENCES Campi(Id),
    FOREIGN KEY (CoordenadorId) REFERENCES Professores(Id)
) AUTO_INCREMENT = 1000;

-- Tabela de Turmas
CREATE TABLE IF NOT EXISTS Turmas (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    AnoIngresso INT NOT NULL,
    AnoFormatura INT NOT NULL,
    CursoId INT NOT NULL,
    FOREIGN KEY (CursoId) REFERENCES Cursos(Id)
) AUTO_INCREMENT = 2000;

-- Tabela de Disciplinas
CREATE TABLE IF NOT EXISTS Disciplinas (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CampusId INT NOT NULL,
    ProfessorId INT NOT NULL,
    NumeroVagas INT NOT NULL,
    Horario TIME NOT NULL,
    FOREIGN KEY (CampusId) REFERENCES Campi(Id),
    FOREIGN KEY (ProfessorId) REFERENCES Professores(Id)
) AUTO_INCREMENT = 3000;

-- Tabela de Serviços
CREATE TABLE IF NOT EXISTS Servicos (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NomeServico VARCHAR(100) NOT NULL,
    CampusId INT NOT NULL,
    FOREIGN KEY (CampusId) REFERENCES Campi(Id)
) AUTO_INCREMENT = 4000;

-- Tabela de Alunos
CREATE TABLE IF NOT EXISTS Alunos (
    Matricula INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    RG VARCHAR(12) NOT NULL,
    DataNascimento DATE NOT NULL,
    Genero VARCHAR(10) NOT NULL,
    Nacionalidade VARCHAR(50) NOT NULL,
    Telefone VARCHAR(20) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    EnderecoId INT NOT NULL,
    CursoId INT NOT NULL,
    TurmaId INT NOT NULL,
    UserId INT NOT NULL UNIQUE,
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (EnderecoId) REFERENCES Enderecos(Id),
    FOREIGN KEY (CursoId) REFERENCES Cursos(Id),
    FOREIGN KEY (TurmaId) REFERENCES Turmas(Id)
) AUTO_INCREMENT = 20000;

-- Tabela de Matrículas
CREATE TABLE Matriculas (
    AlunoId INT NOT NULL,
    DisciplinaId INT NOT NULL,
    PRIMARY KEY (AlunoId, DisciplinaId),
    FOREIGN KEY (AlunoId) REFERENCES Alunos(Matricula),
    FOREIGN KEY (DisciplinaId) REFERENCES Disciplinas(Id)
);
