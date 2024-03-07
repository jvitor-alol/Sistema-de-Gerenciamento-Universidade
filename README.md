# Sistema de Gerenciamento Universitário

Este projeto foi desenvolvido como parte da disciplina Projeto Integrador III: Desenvolvimento de Sistemas Orientado a Objetos.

O sistema foi desenvolvido em C# utilizando o framework ASP.NET para a API de conexão com o banco de dados, enquanto o Node.js foi empregado para gerenciar a interface web GUI. O banco de dados utilizado foi o MySQL , implementado em um container Docker, visando simplificar os testes e facilitar a utilização por todos os colaboradores do grupo.

<div align="center">
  
  <img src="https://img.shields.io/badge/HTML-239120?style=for-the-badge&logo=html5&logoColor=white" alt="HTML">
  <img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=css3&logoColor=white" alt="CSS">
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" alt="JavaScript">
  <img src="https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=node.js&logoColor=white" alt="Node.js">
  <img src="https://img.shields.io/badge/ASP.NET-5C2D91?style=for-the-badge&logo=.net&logoColor=white" alt="ASP.NET">
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL">
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker">
  
</div>

## Funcionalidades

- **Login de Usuário**: Limita funcionalidades ao sistema a usuários autenticados.
- **Cadastro de Alunos**: Permite o cadastro e gerenciamento de alunos matriculados na universidade.
- **Cadastro de Funcionários**: Possibilita o registro e gerenciamento dos funcionários.
- **Dashboard do Aluno**: Página do aluno onde ele pode gerenciar suas matrículas e atualizar seus dados.
- **Matrícula em Disciplinas**: Permite que alunos se matriculem em disciplinas disponíveis.
- **Dashboard do Professor**: Página do professor onde ele pode gerenciar as aulas que ministra.
- **Dashboard do Funcionário**: Página do funcionário com informações de pagamento e dados pessoais.
- **Gestão de Disciplinas**: Permite a criação, edição e exclusão de disciplinas oferecidas pela universidade.

## Protótipos

As telas da interface Web GUI foram desenvolvidas utilizando a ferramenta online Figma.

### Tela Inicial

![Tela de Login](<Protótipos/Figma/Página inicial.png>)

## Dashboard do Funcionário (Administrador)

![Dashboard do Funcionário](<Protótipos/Figma/Dashboard (funcionário - menu aberto).png>)
![Dashboard do Funcionário - Menu](<Protótipos/Figma/Dashboard (funcionário).png>)

### Dashboard do Aluno

![Dashboard do Aluno](<Protótipos/Figma/Dashboard (Aluno).png>)
![Dashboard do Aluno - Menu](<Protótipos/Figma/Dashboard (Aluno - menu aberto).png>)

### Dashboard do Professor

![Dashboard do Professor](<Protótipos/Figma/Dashboard (professor).png>)
![Dashboard do Professor - Menu](<Protótipos/Figma/Dashboard (professor - menu aberto).png>)

### Calendário

![Calendário](Protótipos/Figma/Calendário.png)

> [Apresentação de telas na plataforma](https://www.figma.com/proto/aO0cKZjGMOtKTbFmtgoUG5/Projeto-Integrador?type=design&node-id=26-60&t=qMezBdqddBhRHF38-1&scaling=min-zoom&page-id=0%3A1&mode=design)

## Banco de Dados

O sistema possui persistência de dados por meio de um servidor MySQL, de acordo com o Modelo Entidade-Relacionamento (MER) abaixo:

![MER](./Infra/workbench/mer-revisado.png)

## API

A API, quando completa, será eventualmente utilizada para gerenciar a comunicação e as requisições entre a aplicação web e o banco de dados.

Alguns dos controllers e models já foram implementados no back-end e conseguem recuperar dados do MySQL como pode ser visto abaixo.

![API 1](./Protótipos/Swagger/testes-api-1.png)
![API 2](./Protótipos/Swagger/testes-api-2.png)
![DB](./Protótipos/Swagger/query-db.png)

## Colaboradores

<div align="center">
    <table style="width: 100%; border-collapse: collapse; text-align: center;">
    <tr>
        <td style="padding: 20px; border: 1px solid #ddd; vertical-align: middle;">
            <img src="https://avatars.githubusercontent.com/u/74667067?v=4" alt="jvitor-alol" style="display: block; margin: 0 auto; width: 100px; height: 100px;">
            <a href="https://github.com/jvitor-alol" target="_blank"><p>jvitor-alol</p></a>
        </td>
        <td style="padding: 20px; border: 1px solid #ddd; vertical-align: middle;">
            <img src="https://avatars.githubusercontent.com/u/85653011?v=4" alt="Lynn-Noob" style="display: block; margin: 0 auto; width: 100px; height: 100px;">
            <a href="https://github.com/Lynn-Noob" target="_blank"><p>Lynn-Noob</p></a>
        </td>
        <td style="padding: 20px; border: 1px solid #ddd; vertical-align: middle;">
            <img src="https://avatars.githubusercontent.com/u/95151247?v=4" alt="Guilherme-Soares05" style="display: block; margin: 0 auto; width: 100px; height: 100px;">
            <a href="https://github.com/Guilherme-Soares05" target="_blank"><p>Guilherme-Soares05</p></a>
        </td>
        <td style="padding: 20px; border: 1px solid #ddd; vertical-align: middle;">
            <img src="https://avatars.githubusercontent.com/u/94906196?v=4" alt="Rosicre" style="display: block; margin: 0 auto; width: 100px; height: 100px;">
            <a href="https://github.com/Rosicre" target="_blank"><p>Rosicre</p></a>
        </td>
    </tr>
    <tr>
        <td style="padding: 20px; border: 1px solid #ddd; vertical-align: middle;">
            <img src="https://avatars.githubusercontent.com/u/142458518?v=4" alt="mirelaads" style="display: block; margin: 0 auto; width: 100px; height: 100px;">
            <a href="https://github.com/mirelaads" target="_blank"><p>mirelaads</p></a>
        </td>
        <td style="padding: 20px; border: 1px solid #ddd; vertical-align: middle;">
            <img src="https://avatars.githubusercontent.com/u/102329062?v=4" alt="medinaandre" style="display: block; margin: 0 auto; width: 100px; height: 100px;">
            <a href="https://github.com/medinaandre" target="_blank"><p>medinaandre</p></a>
        </td>
        <td style="padding: 20px; border: 1px solid #ddd; vertical-align: middle;">
            <img src="https://avatars.githubusercontent.com/u/86894587?v=4" alt="dkexs" style="display: block; margin: 0 auto; width: 100px; height: 100px;">
            <a href="https://github.com/dkexs" target="_blank"><p>dkexs</p></a>
        </td>
        <td style="padding: 20px; border: 1px solid #ddd; vertical-align: middle;">
            <img src="https://avatars.githubusercontent.com/u/60987344?v=4" alt="PedroBrito22" style="display: block; margin: 0 auto; width: 100px; height: 100px;">
            <a href="https://github.com/PedroBrito22" target="_blank"><p>PedroBrito22</p></a>
        </td>
    </tr>
  </table>
</div>
