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
      it "creates the user with correct attributes"
    end

    context "when it hasnt valid params" do
      it "does not create user"
    end
  end
end
