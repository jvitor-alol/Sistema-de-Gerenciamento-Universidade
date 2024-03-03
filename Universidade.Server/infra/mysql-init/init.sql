-- Tabela de Alunos
CREATE TABLE Alunos (
    Nome VARCHAR(50) NOT NULL,
    Matricula INT NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    DataNascimento DATE NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Rua VARCHAR(100) NOT NULL,
    Bairro VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado VARCHAR(2) NOT NULL,
    Numero INT NOT NULL,
    Logradouro VARCHAR(50) NOT NULL,
    PRIMARY KEY (Matricula)
);

-- Tabela de Funcionários
CREATE TABLE Funcionarios (
    Nome VARCHAR(50) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    MateriaEspecializacao VARCHAR(50),
    CargaHoraria VARCHAR(20),
    EmailProfissional VARCHAR(50) NOT NULL,
    PRIMARY KEY (CPF)
);

-- Tabela de Universidade
CREATE TABLE Universidade (
    Nome VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(14) NOT NULL,
    Servicos VARCHAR(100),
    Cursos VARCHAR(100),
    Materias VARCHAR(100),
    Rua VARCHAR(100) NOT NULL,
    Bairro VARCHAR(50) NOT NULL,
    Cidade VARCHAR(50) NOT NULL,
    Estado VARCHAR(2) NOT NULL,
    Numero INT NOT NULL,
    Logradouro VARCHAR(50) NOT NULL,
    PRIMARY KEY (CNPJ)
);