USE Universidade;

START TRANSACTION;

-- Inserir usuários
INSERT INTO Users (Username, PasswordHash) VALUES ('professor1', SHA2('password', 256));
INSERT INTO Users (Username, PasswordHash) VALUES ('aluno1', SHA2('password', 256));

-- Inserir associação de usuário ao grupo
INSERT INTO Groupuser (UserId, GroupId) VALUES ((SELECT Id FROM Users WHERE Username = 'professor1'), (SELECT Id FROM Groups WHERE Name = 'professores'));
INSERT INTO Groupuser (UserId, GroupId) VALUES ((SELECT Id FROM Users WHERE Username = 'aluno1'), (SELECT Id FROM Groups WHERE Name = 'alunos'));

-- Inserir endereço
INSERT INTO Enderecos (Rua, Numero, Bairro, Cidade, Estado) VALUES ('Rua Exemplo', 123, 'Bairro Exemplo', 'Cidade Exemplo', 'CE');

-- Inserir campus
INSERT INTO Campi (CNPJ, Nome, EnderecoId) VALUES ('12345678901234', 'Campus Exemplo', (SELECT Id FROM Enderecos WHERE Rua = 'Rua Exemplo'));

-- Inserir professor
INSERT INTO Professores (Nome, Sobrenome, CPF, RG, DataNascimento, Genero, Nacionalidade, Telefone, EmailProfissional, EmailPessoal, EnderecoId, CargaHoraria, SalarioHora, Especializacao, CampusId, UserId) VALUES ('João', 'Silva', '12345678901', '1234567890', '1990-01-01', 'Masculino', 'Brasileiro', '123456789', 'joao@professor.com', 'joao@gmail.com', (SELECT Id FROM Enderecos WHERE Rua = 'Rua Exemplo'), '40', 50.00, 'Matemática', (SELECT Id FROM Campi WHERE Nome = 'Campus Exemplo'), (SELECT Id FROM Users WHERE Username = 'professor1'));

-- Inserir curso
INSERT INTO Cursos (NomeCurso, CampusId, CoordenadorId) VALUES ('Curso de Exemplo', (SELECT Id FROM Campi WHERE Nome = 'Campus Exemplo'), (SELECT Id FROM Professores WHERE Nome = 'João'));

-- Inserir turma
INSERT INTO Turmas (AnoIngresso, AnoFormatura, CursoId) VALUES (2022, 2026, (SELECT Id FROM Cursos WHERE NomeCurso = 'Curso de Exemplo'));

-- Inserir disciplina
INSERT INTO Disciplinas (Nome, CampusId, ProfessorId, NumeroVagas, Horario) VALUES ('Disciplina Exemplo', (SELECT Id FROM Campi WHERE Nome = 'Campus Exemplo'), (SELECT Id FROM Professores WHERE Nome = 'João'), 50, '08:00:00');

-- Inserir serviço
INSERT INTO Servicos (NomeServico, CampusId) VALUES ('Serviço Exemplo', (SELECT Id FROM Campi WHERE Nome = 'Campus Exemplo'));

-- Inserir aluno
INSERT INTO Alunos (Nome, Sobrenome, CPF, RG, DataNascimento, Genero, Nacionalidade, Telefone, Email, EnderecoId, CursoId, TurmaId, UserId) VALUES ('Maria', 'Silva', '98765432109', '0987654321', '1995-01-01', 'Feminino', 'Brasileira', '987654321', 'maria@gmail.com', (SELECT Id FROM Enderecos WHERE Rua = 'Rua Exemplo'), (SELECT Id FROM Cursos WHERE NomeCurso = 'Curso de Exemplo'), (SELECT Id FROM Turmas WHERE AnoIngresso = 2022), (SELECT Id FROM Users WHERE Username = 'aluno1'));

-- Inserir matrícula
INSERT INTO Matriculas (AlunoId, DisciplinaId) VALUES ((SELECT Matricula FROM Alunos WHERE Nome = 'Maria'), (SELECT Id FROM Disciplinas WHERE Nome = 'Disciplina Exemplo'));

COMMIT;
