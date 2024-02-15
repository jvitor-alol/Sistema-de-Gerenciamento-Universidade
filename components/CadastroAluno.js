// components/CadastroAluno.js
import React, { useState } from "react";
import styles from "../styles/style.module.css";

function CadastroAluno() {
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
    console.log("Aluno cadastrado:", aluno);

    // Aqui você pode adicionar a lógica para enviar os dados para o backend
    // Exemplo de requisição para o backend usando fetch:
    fetch("/api/cadastrar-aluno", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(aluno),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log("Resposta do servidor:", data);
        // Adicione lógica adicional conforme necessário
      })
      .catch((error) => {
        console.error("Erro ao enviar dados para o servidor:", error);
      });
  };

  return (
    <div className={styles.cadastroAluno}>
      <h2>Cadastro de Aluno</h2>
      <form onSubmit={handleSubmit}>
        {/* Restante do formulário ... */}
        <button type="submit">Cadastrar</button>
      </form>
    </div>
  );
}

export default CadastroAluno;
