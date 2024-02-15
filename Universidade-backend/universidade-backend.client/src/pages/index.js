// CadastroAluno.js

import React, { useState } from "react";

const CadastroAluno = () => {
  const [aluno, setAluno] = useState({
    nome: "",
    dataNascimento: "",
    endereco: "",
    email: "",
    telefone: "",
    documentoIdentificacao: "",
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setAluno((prevAluno) => ({
      ...prevAluno,
      [name]: value,
    }));
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    // Aqui você pode adicionar a lógica para verificar as informações e cadastrar o aluno
    // Por enquanto, apenas exibiremos os dados no console
    console.log("Aluno cadastrado:", aluno);
  };

  return (
    <div>
      <h2>Cadastrar Aluno</h2>
      <form onSubmit={handleSubmit}>
        <label>
          Nome:
          <input
            type="text"
            name="nome"
            value={aluno.nome}
            onChange={handleChange}
            required
          />
        </label>
        <br />
        <label>
          Data de Nascimento:
          <input
            type="date"
            name="dataNascimento"
            value={aluno.dataNascimento}
            onChange={handleChange}
            required
          />
        </label>
        <br />
        <label>
          Endereço:
          <input
            type="text"
            name="endereco"
            value={aluno.endereco}
            onChange={handleChange}
            required
          />
        </label>
        <br />
        <label>
          Email:
          <input
            type="email"
            name="email"
            value={aluno.email}
            onChange={handleChange}
            required
          />
        </label>
        <br />
        <label>
          Telefone:
          <input
            type="tel"
            name="telefone"
            value={aluno.telefone}
            onChange={handleChange}
            required
          />
        </label>
        <br />
        <label>
          Documento de Identificação (RG ou CPF):
          <input
            type="text"
            name="documentoIdentificacao"
            value={aluno.documentoIdentificacao}
            onChange={handleChange}
            required
          />
        </label>
        <br />
        <button type="submit">Cadastrar</button>
      </form>
    </div>
  );
};

export default CadastroAluno;
