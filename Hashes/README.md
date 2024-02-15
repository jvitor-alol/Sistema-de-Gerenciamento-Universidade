# Rodando a aplicação com Docker

```bash
docker run -i --rm -e ARGS=<argumentos_do_programa> --name <nome_do_container> jvitoralol/mascarar_dados:latest
```

**-i:** Mantém o stdin aberto, permitindo a interação com o terminal.

**--rm:** Remove automaticamente o contêiner após a execução.

**-e ARGS=<argumentos_do_programa>:** Substitua <argumentos_do_programa> pelos argumentos reais que você deseja passar **<u>(OPCIONAL)</u>**.

**--name <nome_do_container>:** Atribui um nome ao contêiner. Substitua <nome_do_container> pelo nome desejado para o contêiner.
