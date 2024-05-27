# Flutter Login e To-Do List App

Este é um exemplo simples de um aplicativo Flutter que demonstra como criar uma página de login e uma segunda tela com uma lista de tarefas (to-do list).

## Funcionalidades

- Página de login com campos de email e senha.
- Autenticação básica (sem verificação real).
- Navegação para a segunda tela após o login.
- Segunda tela exibindo uma lista de tarefas.

## Tecnologias usadas

- **Flutter:** Framework de desenvolvimento de aplicativos móveis multiplataforma.
- **FastAPI:** Framework web para construção de APIs rápidas e rápidas.
- **SQLite:** Banco de dados local para armazenamento das tarefas.

## Pré-requisitos

- Flutter SDK instalado no seu ambiente de desenvolvimento.
- Editor de código (recomendado: Visual Studio Code, Android Studio, etc.).
- Emulador Android/iOS ou dispositivo físico para testar o aplicativo.

- Execute o seguinte comando na pasta ponderada4 para subir o servidor FastAPI:
    ```bash
    docker-compose up --build
    ```

## Como usar

1. Clone ou faça o download deste repositório.

2. Abra o projeto no seu editor de código.

3. Certifique-se de que seu dispositivo de emulação ou dispositivo físico está conectado e configurado corretamente.

4. Execute o aplicativo usando o "Run and Debug" do VSCode

5. A página de login será exibida. Você pode inserir qualquer email e senha (não há verificação real) e clicar no botão "Login".

6. Após o login bem-sucedido, você será levado para a segunda tela com a lista de tarefas.

7. Na segunda tela, você verá um botão para adicionar tarefas, alterá-las e removê-las.

## Principais Trechos do Código

### FastAPI

- `main.py`: Este arquivo contém o código principal do servidor FastAPI.
- Rotas:
  - `/users/login`: Rota para autenticar o usuário.
  - `/todo/create`: Rota para criar uma nova tarefa.
  - `/todo/update/{id}`: Rota para atualizar uma tarefa existente.
  - `/todo/delete/{id}`: Rota para excluir uma tarefa.

### Flutter

- `main.dart`: Este arquivo contém o código principal do aplicativo Flutter.
- Widgets:
  - `SecondScreen`: Tela principal para exibir a lista de tarefas e interações do usuário.
  - `TaskCard`: Widget para exibir cada tarefa na lista.
  - `Task`: Classe de modelo para representar uma tarefa.

## Observações

- Certifique-se de que o servidor FastAPI esteja em execução antes de iniciar o aplicativo Flutter.
- As rotas do servidor FastAPI estão configuradas para hospedagem local. Se você estiver implantando em outra rede, atualize os URLs das rotas na aplicação conforme necessário.

## Vídeo

<a href="https://youtu.be/rZfYNupexQQ">vídeo de apoio<a>

