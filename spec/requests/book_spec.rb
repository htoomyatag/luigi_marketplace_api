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

      before do
        delete "/v1/book/unpublish/#{book.id}"
      end

      it 'returns status code 204' do
         expect(json_body["status"]).to eq 204
      end
   end

end



