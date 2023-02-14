require 'rails_helper'
require 'json'

RSpec.describe "Books", type: :request do

  describe "GET /index" do
    let!(:book) { FactoryBot.create_list(:book, 5) }
    
    before {get '/v1/books.json'}

      it 'returns status code 200 ok' do
        expect(response).to have_http_status(:ok)
      end
  
      it 'returns 5 books' do
        expect(json_body["data"].count).to eq(5)
      end
  end

  describe "DELETE /unpublish/:id" do
      let!(:book) { FactoryBot.create(:book) }

      it "deletes the book and should respond with a 204 no content" do
        expect{delete "/v1/book/unpublish/#{book.id}"}.to change(Book,:count).by(-1)
        expect(response).to have_http_status(:no_content)
      end

   end

end



