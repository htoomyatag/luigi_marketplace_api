require 'rails_helper'
require 'json'

RSpec.describe "Books", type: :request do

  describe "GET /index" do
    let!(:book) {FactoryBot.create_list(:book, 5)}
    before {get '/v1/books.json'}

    it 'returns status code 200 ok' do
      expect(response).to have_http_status(:ok)
    end
    it 'returns 5 books' do
    	expect(json_body["data"].count).to eq(5)
    end
  end

  describe "DELETE /unpublish/:id" do
    let!(:user) {FactoryBot.create(:user)}
    let!(:book) {FactoryBot.create(:book)}
    before do
      login_as(user)
    end 

    it "deletes the book and should respond with a 204 no content" do
    	expect{ delete "/v1/book/unpublish/#{book.id}", headers: {"Authorization": "Bearer #{json_body['token']}", "Accept": "application/json"}}.to change(Book,:count).by(-1)
    	expect(response).to have_http_status(:no_content)
    end
  end

  describe "POST /books/" do
    let!(:user) {FactoryBot.create(:user)}
    before do
      login_as(user)  
    end 

    scenario 'invalid book attributes' do
      post "/v1/books.json", headers: {"Authorization": "Bearer #{json_body['token']}", "Accept": "application/json"}, params: {
        book: {
          title: nil,
          description: nil, 
          cover_image: nil, 
          price: nil,
          user_id: nil
        }
      }

      expect(validation_error_msg("title")).to eq(["can't be blank"])
      expect(validation_error_msg("cover_image")).to eq(["can't be blank", "is not a valid URL"])
      expect(validation_error_msg("price")).to eq(["can't be blank"])
      expect(validation_error_msg("user")).to eq(['must exist'])
    end

    scenario 'valid book attributes' do
      post '/v1/books.json', headers: {"Authorization": "Bearer #{json_body['token']}", "Accept": "application/json"}, params: {
        book: { 
        	title: "Gone with the wind",
          description: "book summary",
          cover_image: "https://loremflickr.com/300/300",
          price: 28.65,
          user_id: 1 
        }
      }

      expect(json_body['title']).to eq('Gone with the wind')
      expect(json_body['description']).to eq('book summary')
      expect(json_body['cover_image']).to eq('https://loremflickr.com/300/300')
      expect(json_body['price']).to eq("28.65")
      expect(json_body['user_id']).to eq(1)
      expect(response).to have_http_status(:ok)
    end
  end

  describe "PUT update/:id" do
    let!(:book) { FactoryBot.create(:book) }
    let!(:user) { FactoryBot.create(:user) }
    before do
      login_as(user)
    end 

    it 'update books data' do
      put "/v1/books/#{book.id}.json",headers: {"Authorization": "Bearer #{json_body['token']}", "Accept": "application/json"}, params: {
      	book: {
        	title: 'the last samurai',
          description: "new desc",
          price: 50.45
        }
      }

      expect(json_body['title']).to eq('the last samurai')
      expect(json_body['description']).to eq('new desc')
      expect(json_body['price']).to eq("50.45")
    end
  end

  describe "GET search" do
    scenario 'search with valid params' do
      get '/v1/book/search.json', params: {query: "samurai"}
      expect(json_body['title']).to eq("the last samurai")
    end
    scenario 'search with invalid params' do
      get '/v1/book/search.json'
      expect(json_body['message']).to eq("No data")
    end
  end
end