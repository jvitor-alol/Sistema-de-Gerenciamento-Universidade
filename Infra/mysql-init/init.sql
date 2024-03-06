-- Criação do banco de dados da universidade
CREATE DATABASE IF NOT EXISTS Universidade;

USE Universidade;

START TRANSACTION;

-- Tabela de autenticação de usuários
CREATE TABLE IF NOT EXISTS Users (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    PermissionGroup VARCHAR(50) NOT NULL,
    PermissionsDescription VARCHAR(255),
    CreationDate DATE NOT NULL,
    LastUpdated DATE
);

-- Inserir usuários iniciais com senhas já hashadas
INSERT INTO Users (Username, PasswordHash, Role, PermissionGroup, PermissionsDescription, CreationDate) VALUES
('admin', SHA2('admin', 256), 'Administrador', 'Administradores', 'Controle Total', NOW()),
('funcionario_testes', SHA2('teste1234', 256), 'Funcionário', 'Padrão', 'Perfil Limitado', NOW()),
('professor_testes', SHA2('teste1234', 256), 'Professor', 'Padrão', 'Perfil Limitado', NOW()),
('aluno_testes', SHA2('teste1234', 256), 'Aluno', 'Padrão', 'Perfil Limitado', NOW());

-- Tabela de Endereços
CREATE TABLE IF NOT EXISTS Enderecos (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Rua VARCHAR(100) NOT NULL,
    Numero INT NOT NULL,
    CEP CHAR(8) NOT NULL,
    Bairro VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado CHAR(2) NOT NULL
);

-- Tabela de Campi
CREATE TABLE IF NOT EXISTS Campi (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CNPJ CHAR(14) NOT NULL UNIQUE,
    Nome VARCHAR(100) NOT NULL,
    EnderecoId INT NOT NULL,
    FOREIGN KEY (EnderecoId) REFERENCES Enderecos(Id)
);

-- Tabela de Funcionários
CREATE TABLE IF NOT EXISTS Funcionarios (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    RG VARCHAR(12) NOT NULL,
    DataNascimento DATE NOT NULL,
    Genero VARCHAR(10) NOT NULL,
    Nacionalidade VARCHAR(50) NOT NULL,
    Telefone VARCHAR(20) UNIQUE,
    Celular VARCHAR(20) NOT NULL UNIQUE,
    EmailInstitucional VARCHAR(100) NOT NULL UNIQUE,
    EmailPessoal VARCHAR(100) UNIQUE,
    EnderecoId INT NOT NULL,
    CargaHoraria INT NOT NULL,
    SalarioHora DECIMAL(10, 2) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    DataContratacao DATE NOT NULL,
    CampusId INT NOT NULL,
    UserId INT UNIQUE,
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (CampusId) REFERENCES Campi(Id),
    FOREIGN KEY (EnderecoId) REFERENCES Enderecos(Id)
);

-- Tabela de Professores
CREATE TABLE IF NOT EXISTS Professores (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Especializacao VARCHAR(100) NOT NULL,
    Departamento VARCHAR(100) NOT NULL,
    FuncionarioId INT NOT NULL UNIQUE,
    FOREIGN KEY (FuncionarioId) REFERENCES Funcionarios(Id)
);

-- Tabela de Cursos
CREATE TABLE IF NOT EXISTS Cursos (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL UNIQUE,
    CampusId INT NOT NULL,
    Departamento VARCHAR(100) NOT NULL,
    CoordenadorId INT,
    FOREIGN KEY (CampusId) REFERENCES Campi(Id),
    FOREIGN KEY (CoordenadorId) REFERENCES Professores(Id)
);

-- Tabela de Turmas
CREATE TABLE IF NOT EXISTS Turmas (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    AnoIngresso INT NOT NULL,
    AnoFormatura INT NOT NULL,
    CursoId INT NOT NULL,
    FOREIGN KEY (CursoId) REFERENCES Cursos(Id)
);

-- Tabela de Disciplinas
CREATE TABLE IF NOT EXISTS Disciplinas (
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL UNIQUE,
    CampusId INT NOT NULL,
    ProfessorId INT NOT NULL,
    NumeroVagas INT NOT NULL,
    Horario TIME NOT NULL,
    FOREIGN KEY (CampusId) REFERENCES Campi(Id),
    FOREIGN KEY (ProfessorId) REFERENCES Professores(Id)
);

-- Tabela de Alunos
CREATE TABLE IF NOT EXISTS Alunos (
    IdMatricula INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE,
    RG VARCHAR(12) NOT NULL,
    DataNascimento DATE NOT NULL,
    Genero VARCHAR(10) NOT NULL,
    Nacionalidade VARCHAR(50) NOT NULL,
    Telefone VARCHAR(20) UNIQUE,
    Celular VARCHAR(20) NOT NULL UNIQUE,
    EmailInstitucional VARCHAR(100) NOT NULL UNIQUE,
    EmailPessoal VARCHAR(100) UNIQUE,
    EnderecoId INT NOT NULL,
    DataMatricula DATE NOT NULL,
    CursoId INT NOT NULL,
    TurmaId INT NOT NULL,
    UserId INT UNIQUE,
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (EnderecoId) REFERENCES Enderecos(Id),
    FOREIGN KEY (CursoId) REFERENCES Cursos(Id),
    FOREIGN KEY (TurmaId) REFERENCES Turmas(Id)
);

-- Tabela de Matrículas
CREATE TABLE Matriculas (
    AlunoId INT NOT NULL,
    DisciplinaId INT NOT NULL,
    DataMatricula DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Nota DECIMAL(4, 2),
    PRIMARY KEY (AlunoId, DisciplinaId),
    FOREIGN KEY (AlunoId) REFERENCES Alunos(IdMatricula),
    FOREIGN KEY (DisciplinaId) REFERENCES Disciplinas(Id)
);

COMMIT;