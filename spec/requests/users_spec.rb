require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "returns success status" do
      # chama as rotas do users
      get users_path
      # espera o response, resposta da url e verificar se ela retorna codigo de sucess
      expect(response).to have_http_status(200)
    end
    it "the users tittle is present" do
      # create_list cria no caso 3 usuarios
      users = create_list(:user, 3)
      get users_path
      users.each do |user|
        expect(response.body).to include(user.title)
      end 
    end
  end

  describe "POST /users" do
    context "when it has valid params" do
      it "creates the user with correct attributes" do
        # não cria dados no banco de dados, usa os dados do FactoryBot
        user_attributes = FactoryBot.attributes_for(:user)
        # obtem as rotas com metodo post, e passa como parametro o user_attibutes criado
        post users_path, params: { user: user_attributes }
        # garante que o ultimo usuario existe e tem os atributos necessarios
        expect(User.last).to have_attributes(user_attributes)
      end
    end

    context "when it hasnt valid params" do
      it "does not create user" do
        # Expect diferente. Faz um post com params todos vazios, e depois verifica, se o contador de usuarios :count não tenha mudado
        # Ou seja, nenhum User foi criado 
        expect{
          post users_path, params: { user: {kind: '', name: '', level: ''}}
        }.to_not change(User, :count)
      end
    end
  end
end
