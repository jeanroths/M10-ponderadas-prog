# API de Gerenciamento de Usuários e Tarefas

Esta é uma API desenvolvida em FastAPI para gerenciar usuários e suas respectivas tarefas. Ela utiliza um banco de dados local com o ORM Ormar e autenticação JWT para garantir a segurança das operações.

## Funcionalidades

- **Usuários**: 
  - Cadastrar novos usuários
  - Logar usuários existentes
  - Consultar informações de usuários
  - Deletar usuários

- **Tarefas**:
  - Criar novas tarefas
  - Atualizar tarefas existentes
  - Deletar tarefas
  - Consultar tarefas por ID de usuário

## Tecnologias Utilizadas

- [FastAPI](https://fastapi.tiangolo.com/): Framework web assíncrono de alto desempenho para Python.
- [Ormar](https://collerek.github.io/ormar/): ORM (Object-Relational Mapping) para Python, projetado para funcionar perfeitamente com o FastAPI.
- [JWT (JSON Web Tokens)](https://jwt.io/): Um método padrão aberto (RFC 7519) para representar reivindicações de forma segura entre duas partes.
- [uvicorn](https://www.uvicorn.org/): Um servidor web ASGI de alto desempenho, construído sobre o asyncio do Python.
- [Python 3](https://www.python.org/): Linguagem de programação de alto nível amplamente utilizada.

## Como Rodar o Projeto

1. **Instalação das Dependências**: Certifique-se de ter o Python 3 e o pip instalados em seu sistema. Em seguida, instale as dependências do projeto executando o seguinte comando no terminal:

   ```
   pip install -r requirements.txt
   ```

2. **Execução do Servidor**: Após instalar as dependências, você pode iniciar o servidor FastAPI executando o seguinte comando na raiz do projeto:

   ```
   python3 main.py
   ```

   Isso iniciará o servidor na porta padrão `8000`. Você pode acessar a documentação da API em [http://localhost:8000/docs](http://localhost:8000/docs).

