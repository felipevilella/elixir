<div align="center">
  <img align="center" src="./assets/wabanex-logo.png" width="300px"/>
</div>
&nbsp;
<p align="center">
  <a href="#techs">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#project">Projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#how-use">Como usar</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#how-use">Dicas</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
</p>
&nbsp;&nbsp;&nbsp;

<div id="techs"></div>

## ✨ Tecnologias

Esse projeto foi desenvolvido com as seguintes tecnologias:

- [Elixix](https://elixir-lang.org/)
- [Phoenix](https://phoenixframework.org/)
- [GraphQL](https://graphql.org)
</div>

<div id="project"></div>

## 💻 Projeto

Gerencie e acompanhe seus treinos na academia

&nbsp;&nbsp;&nbsp;

<div align="center">
  <img align="center" src="./assets/schema.png" width="450px"/>
</div>

&nbsp;&nbsp;&nbsp;

<div id="how-use"></div>

## 🚀 Como executar

- Clone o repositório
- Instale o phoenix `mix archive.install hex phx_new 1.5.9`
- Instale as dependencias do projeto `mix deps.get`
- Instale a database e rode as migrations `mix ecto.setup`
- Inicie o servidor do phoenix `mix phx.server`
- Suba o container `docker-ccmpose up'
- Por fim, caso precise você pode alterar as configurações do banco de dados pelo arquivo `dev.exs` e no arquivo `config/test.exs`

Por fim, a aplicação estará disponível em `http://localhost:4000`


## Dicas
- Acesso ao dashbord `http://localhost:4004/dashboard/home`
- Acesso ao painel de teste do graphql `localhost:4004/api/graphiql`
- Criar uma migration `mix ecto.gen.migration nameTable`
- Subir migration `mix ecto.migrate`
- Abrir console `iex -S mix`
- Exemplo para buscas e inserção de dados no graphQL
- obter dados de usuario: `{
  getUser(id: "5491666a-ae19-4f3b-a2eb-f325f41618a5") {
    id,
    email
    name,
    trainings {
      id
      exercises {
        name
        repetitions
      }
    }
  }
}`
- inserir treinos e exercicios: `mutation {
  createTraining(input: {
    start_date: "2021-06-22",
    end_date: "2021-07-22",
    user_id: "5491666a-ae19-4f3b-a2eb-f325f41618a5",
    exercices: [
      {
      name: "Gemeos banco",
      youtube_video_url: "www.google.com",
      protocol_description: "regular",
      repetitions: "4x15"
      },
      {
      name: "Triceps corda",
      youtube_video_url: "www.google.com",
      protocol_description: "regular",
      repetitions: "4x15"
     }
    ]
  }){
    id,
    exercises {
      id,
      name
    }
  }
}`
---

