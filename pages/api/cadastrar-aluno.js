import dotenv from "dotenv";
dotenv.config();

import { Pool } from "pg";

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_DATABASE,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT,
});

export default async function handler(req, res) {
  if (req.method === "POST") {
    const dadosAluno = req.body;
    console.log("Dados recebidos no servidor:", dadosAluno);

    let client; // Declare a variável do cliente fora do bloco try

    try {
      client = await pool.connect();
      await client.query("BEGIN");

      // Lógica para inserção no banco de dados
      const query =
        "INSERT INTO alunos (nome, ... outros campos ...) VALUES ($1, ... outros placeholders ...) RETURNING *";
      const values = [
        dadosAluno.nome,
        // ... outros valores ...
      ];

      const result = await client.query(query, values);
      await client.query("COMMIT");
      const alunoInserido = result.rows[0];

      console.log("Aluno inserido no banco de dados:", alunoInserido);
      res.status(200).json({ message: "Aluno cadastrado com sucesso!" });
    } catch (error) {
      console.error("Erro ao inserir aluno no banco de dados:", error);

      if (client) {
        await client.query("ROLLBACK");
      }

      res.status(500).json({ message: "Erro ao cadastrar aluno" });
    } finally {
      if (client) {
        client.release();
      }
    }
  } else {
    res.status(405).end(); // Método não permitido
  }
}
