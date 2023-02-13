require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /index" do
    let!(:users) {FactoryBot.create_list(:create_user, 10)}
    let!(:books) {FactoryBot.create_list(:create_book, 20)}
    before {get '/v1/books.json'}
    it 'returns all books' do
        expect(JSON.parse(response.body).size).to eq(20)
      end
    it 'returns status code 200' do
        expect(response).to have_http_status(:success)
      end
  end
end

