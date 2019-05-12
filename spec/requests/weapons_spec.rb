require 'rails_helper'

RSpec.describe "Weapons", type: :request do
  describe "GET/weapons" do
    it "the names shows fine" do
      get weapons_path
      expect(response).to have_http_status(200)
    end

    it "verify if all weapon attributes are presents correctly" do
      get weapons_path
      weapons = create_list(:weapon, 5)
      weapons.each do |weapon|
        expect(response.body).to include(weapon.title)
      end
    end
  end

  describe "POST/weapons" do
    context "when user insert the correct data types, or data in yours fields" do
      it "if data was correct"
    end

    context "when user insert INcorrect data types, or data in yours fileds" do
      it "if data wasnt correct"
    end
  end

  describe "DELETE/weapons" do
    it "when user try delete one weapon by id"
  end
end
