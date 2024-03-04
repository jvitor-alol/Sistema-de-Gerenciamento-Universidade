USE universidade;

-- Inserir usuários
INSERT INTO users (username, password_hash) VALUES ('professor1', SHA2('password', 256));
INSERT INTO users (username, password_hash) VALUES ('aluno1', SHA2('password', 256));

-- Inserir associação de usuário ao grupo
INSERT INTO user_groups (user_id, group_id) VALUES ((SELECT id FROM users WHERE username = 'professor1'), (SELECT id FROM groups WHERE name = 'professores'));
INSERT INTO user_groups (user_id, group_id) VALUES ((SELECT id FROM users WHERE username = 'aluno1'), (SELECT id FROM groups WHERE name = 'alunos'));

-- Inserir endereço
INSERT INTO enderecos (rua, numero, bairro, cidade, estado) VALUES ('Rua Exemplo', 123, 'Bairro Exemplo', 'Cidade Exemplo', 'CE');

-- Inserir campus
INSERT INTO campus (cnpj, nome, endereco_id) VALUES ('12345678901234', 'Campus Exemplo', (SELECT id FROM enderecos WHERE rua = 'Rua Exemplo'));

-- Inserir professor
INSERT INTO professores (nome, sobrenome, cpf, rg, data_nascimento, genero, nacionalidade, telefone, email_profissional, email_pessoal, endereco_id, carga_horaria, salario_hora, especializacao, campus_id, user_id) VALUES ('João', 'Silva', '12345678901', '1234567890', '1990-01-01', 'Masculino', 'Brasileiro', '123456789', 'joao@professor.com', 'joao@gmail.com', (SELECT id FROM enderecos WHERE rua = 'Rua Exemplo'), '40h', 50.00, 'Matemática', (SELECT id FROM campus WHERE nome = 'Campus Exemplo'), (SELECT id FROM users WHERE username = 'professor1'));

-- Inserir curso
INSERT INTO cursos (nome_curso, campus_id, coordenador_id) VALUES ('Curso de Exemplo', (SELECT id FROM campus WHERE nome = 'Campus Exemplo'), (SELECT id FROM professores WHERE nome = 'João'));

-- Inserir turma
INSERT INTO turmas (ano_ingresso, ano_formatura, curso_id) VALUES (2022, 2026, (SELECT id FROM cursos WHERE nome_curso = 'Curso de Exemplo'));

-- Inserir disciplina
INSERT INTO disciplinas (nome, campus_id, professor_id, numero_vagas, horario) VALUES ('Disciplina Exemplo', (SELECT id FROM campus WHERE nome = 'Campus Exemplo'), (SELECT id FROM professores WHERE nome = 'João'), 50, '08:00:00');

-- Inserir serviço
INSERT INTO servicos (nome_servico, campus_id) VALUES ('Serviço Exemplo', (SELECT id FROM campus WHERE nome = 'Campus Exemplo'));

-- Inserir aluno
INSERT INTO alunos (nome, sobrenome, cpf, rg, data_nascimento, genero, nacionalidade, telefone, email, endereco_id, curso_id, turma_id, user_id) VALUES ('Maria', 'Silva', '98765432109', '0987654321', '1995-01-01', 'Feminino', 'Brasileira', '987654321', 'maria@gmail.com', (SELECT id FROM enderecos WHERE rua = 'Rua Exemplo'), (SELECT id FROM cursos WHERE nome_curso = 'Curso de Exemplo'), (SELECT id FROM turmas WHERE ano_ingresso = 2022), (SELECT id FROM users WHERE username = 'aluno1'));

-- Inserir matrícula
INSERT INTO matriculas (aluno_id, disciplina_id) VALUES ((SELECT matricula FROM alunos WHERE nome = 'Maria'), (SELECT id FROM disciplinas WHERE nome = 'Disciplina Exemplo'));
