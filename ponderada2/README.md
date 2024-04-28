# Ponderada 2

## Checkpoint 2 - 2022-05-10

Para rodar as duas aplicações é necessário rodar o arquivo `docker-compose.yaml` com o comando:
```
docker compose up
```

## Entrega 28/04 - Comparação entre Sanic e FastAPI para serviços de API REST

Neste documento, é discutido as diferenças entre dois frameworks Python populares para desenvolvimento de serviços de API REST: Sanic e FastAPI. Abordaremos as diferenças em relação à assincronicidade e à velocidade de requisições, bem como as diferenças nas respostas oferecidas por esses frameworks.

## Assincronicidade

### Sanic
Sanic é um framework Python assíncrono baseado no framework web Flask. Ele oferece suporte nativo para assincronicidade, permitindo que manipulemos várias solicitações de forma concorrente, o que pode levar a uma melhor escalabilidade e desempenho em aplicações com grande carga de requisições.

### FastAPI
FastAPI também é um framework Python assíncrono, mas é construído sobre o Starlette e o Pydantic. Ele utiliza a tipagem de dados do Python e a geração automática de documentação Swagger para fornecer uma experiência de desenvolvimento altamente produtiva. Assim como o Sanic, o FastAPI oferece suporte nativo para assincronicidade.

## Velocidade de Requisições

### Sanic
Devido à sua natureza assíncrona e ao uso eficiente dos recursos do sistema, o Sanic geralmente é reconhecido por sua alta velocidade de processamento de requisições. Ele é capaz de lidar com um grande volume de solicitações simultâneas de forma eficiente e escalável.

### FastAPI
O FastAPI também é conhecido por sua alta velocidade de processamento de requisições. Ele aproveita ao máximo as características assíncronas do Python para lidar com várias solicitações simultâneas de forma eficiente. Além disso, sua integração com o Pydantic permite uma validação rápida e eficiente dos dados de entrada.

## Diferença nas Respostas

### Sanic
Sanic fornece respostas rápidas e eficientes para solicitações HTTP. Ele permite definir rotas de forma simples e oferece uma ampla gama de opções para manipular as respostas, incluindo suporte para respostas JSON, HTML, arquivos estáticos, entre outros.

### FastAPI
FastAPI oferece um conjunto abrangente de ferramentas para manipulação de respostas HTTP. Ele suporta respostas JSON, HTML, arquivos estáticos e também possui uma integração fácil com sistemas de banco de dados e autenticação de usuários. Além disso, a geração automática de documentação Swagger facilita a compreensão e o uso das respostas fornecidas pela API.

## Conclusão

Tanto Sanic quanto FastAPI são excelentes escolhas para o desenvolvimento de serviços de API REST em Python. Ambos oferecem suporte nativo para assincronicidade e são conhecidos por sua alta velocidade de processamento de requisições. A escolha entre os dois dependerá das necessidades específicas do projeto e das preferências individuais do desenvolvedor.

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

## Observações

Para o teste das requisições das funcionalidades acima com os serviços criados em Sanic e FastAPI, as colections do Insomnia foram disponibilizados.

## Obs 2:

Murilo, tentei integrar as aplicações com banco de dados Postgresql mas por algum motivo minha máquina não quis configurar, vou tentar arrumar isso essa semana, mas por enquanto estão rodando com banco de dados local...

