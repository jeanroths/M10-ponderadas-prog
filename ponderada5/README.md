
# Ponderada 5 - Aplicação Integrada de Login e Processamento de Imagens

Esta aplicação é um exemplo de uma arquitetura integrada de Flutter em MVC e backend utilizando microsserviços, com foco em um serviço de login de usuário e processamento de imagens.

## Estrutura do Projeto

O projeto é estruturado da seguinte maneira:

```
backend/
│
├── app_login_log/             # Serviço de login de usuário
│   ├── Dockerfile         # Arquivo de configuração do Docker para o serviço de login
│   ├── main.py            # Código principal do serviço de login
│   ├── requirements.txt   # Lista de dependências do serviço de login
│   └── ...
│
├── app_envio_imagens/  # Serviço de processamento de imagens
│   ├── Dockerfile         # Arquivo de configuração do Docker para o serviço de processamento de imagens
│   ├── main.py            # Código principal do serviço de processamento de imagens
│   ├── requirements.txt   # Lista de dependências do serviço de processamento de imagens
│   └── ...
│
├── nginx/                 # Configuração do Nginx para servir como load balancer
│   ├── nginx.conf         # Configuração do Nginx para balanceamento de carga
│
frontend/image_app/lib
│
├── controllers/           # Controladores da aplicação em Flutter
│   ├── image_controller.dart      # Controlador para o processamento de imagens
│   ├── login_controller.dart      # Controlador para o login do usuário
│   └── notification_controller.dart  # Controlador para notificações no app
│
├── models/                # Modelos da aplicação em Flutter
│   └── user_model.dart     # Modelo de usuário
│
├── services/              # Serviços da aplicação em Flutter
│   ├── api_service.dart        # Serviço para integração com API
│   └── notification_service.dart   # Serviço para notificações
│
├── views/                 # Telas da aplicação em Flutter
│   ├── image_page.dart      # Tela para seleção e processamento de imagens
│   ├── login_page.dart      # Tela de login
│
├── main.dart              # Ponto de entrada da aplicação Flutter
└── ...

docker-compose.yaml       # Arquivo de configuração do Docker Compose para o ambiente de desenvolvimento
README.md                 # Este arquivo
```

## Backend

### Serviço de Login (`app_login_log`)

O serviço de login é responsável por autenticar os usuários na aplicação. Utiliza Flask como framework web e está configurado para rodar na porta `8001`.

1. **Login de Usuário:**
   - Navegue até a pasta `app_login_log`.
   - Execute o servidor FastAPI com o comando:
     ```
     python3 main.py
     ```
   - Instale as dependências necessárias, se necessário.

### Serviço de Processamento de Imagens (`app_envio_imagens`)

O serviço de processamento de imagens recebe imagens enviadas pelo frontend, realiza o processamento e envia de volta a imagem processada. Utiliza Flask como framework web e está configurado para rodar na porta `8002`.

2. **Processamento de Imagens:**
   - Navegue até a pasta `app_envio_imagens`.
   - Execute o servidor FastAPI com o comando:
     ```
     python3 main.py
     ```
   - Instale as dependências necessárias, se necessário.

### Nginx como Load Balancer

O Nginx é utilizado como load balancer para distribuir o tráfego entre os serviços de login e processamento de imagens.

## Frontend

### Arquitetura MVC em Flutter

O frontend é desenvolvido em Flutter utilizando a arquitetura MVC para separação de responsabilidades.

### Controllers

- **image_controller.dart**: Controla o processo de seleção e envio de imagens para o backend para processamento.
- **login_controller.dart**: Controla o processo de login de usuários na aplicação.
- **notification_controller.dart**: Controla o envio de notificações para o aplicativo.

### Models

- **user_model.dart**: Define o modelo de dados para usuário.

### Services

- **api_service.dart**: Serviço para integração com a API backend.
- **local_notifications.dart**: Serviço para notificações locais.
- **notification_service.dart**: Serviço para notificações.

### Views

- **image_page.dart**: Tela para seleção e processamento de imagens.
- **login_page.dart**: Tela de login.

### Main

- **main.dart**: Ponto de entrada da aplicação Flutter.

## Como Executar

Abra o arquivo `main.dart`e inicie a depuração (Run and start debug) usando ou Android Studio ou um dispositivo compativel para compilar a aplicação.

### Observação

O Docker Compose não está funcional no momento. Para acessar os serviços do backend pelo frontend, as rotas estão relativas ao endereço IP da máquina local.

### Vídeo

https://github.com/jeanroths/M10-ponderadas-prog/assets/99195775/cdd8e7a1-1a26-4b89-936a-2eb0f9bec26f





