"""
-- Criar novo script Python que implementa o algoritmo a seguir:

1 - Receber uma string via input

2 - Gerar o hash da string por meio do algoritmo SHA-1

3 - Imprimir o hash em tela, utilizando o método hexdigest

4 - Retornar ao passo 1


-- Criar uma imagem Docker chamada mascarar-dados que execute o script Python
    criado anteriormente

-- Iniciar um container a partir da imagem, enviando algumas palavras para
    mascaramento

-- Registrar o conteúdo do script Python, arquivo Dockerfile e comando de
    inicialização do container neste espaço.
"""

import hashlib
import sys


def mascarar_dados(texto: str) -> None:
    texto_bytes = texto.encode('utf-8')

    h = hashlib.new('sha1')
    h.update(texto_bytes)

    print(f'\nTexto original: {texto}')
    print(f'Texto encriptado: {h.hexdigest()}')


if __name__ == '__main__':
    argumentos = sys.argv

    if len(argumentos) > 1:
        for i in argumentos[1:]:
            mascarar_dados(i)

    while True:
        try:
            texto = input(
                '\nInsira seu texto (ou pressione Enter para sair): ')
            if not texto:
                break
            mascarar_dados(texto)
        except EOFError:
            break
