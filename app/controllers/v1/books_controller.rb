class V1::BooksController < ApplicationController
  require_relative '../helpers/book_helper'
  include BookHelper
  before_action :authenticate_request, except: %i[ index show search]
  before_action :set_book, only: %i[ show update destroy unpublish]
  respond_to :xml, :json

  # GET /v1/books.json
  # GET /v1/books.xml
  def index
    @books = Book.all
    respond_with(JSON.parse(set_serializer(@books)))
  end

  # GET /v1/books/1
  def show
    respond_with(JSON.parse(set_serializer(@book)))
  end

  # DELETE /v1/book/unpublish/:id
  def unpublish
    @book.delete
  end

  # POST /v1/books
  def create
    @book = Book.create(book_params) 
    respond_to do |format|
      if @book.save
        format.json  { render json: @book }
        format.xml  { render xml: JSON.parse(@book.to_json).to_xml }
      else
        format.json  { render json: {error: @book.errors}}
        format.xml  { render xml: JSON.parse(@book.errors.to_json).to_xml }
      end
    end
  end

  # PATCH/PUT /v1/books/1
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.json  { render json: @book }
        format.xml  { render xml: JSON.parse(@book.to_json).to_xml }
      else
        format.json  { render json: {error: @book.errors}}
        format.xml  { render xml: JSON.parse(@book.errors.to_json).to_xml }
      end
    end
  end

  # GET /v1/book/search?query=
  def search
    result = Book.all.search(params["query"]).response.dig("hits", "hits","0","_source")
    respond_to do |format|
      unless params[:query].blank? or result.nil?
        format.json  { render json: result}
        format.xml  { render xml: result }
      else
        format.json  { render json: {result: nil, message: 'No data'}}
        format.xml  { render xml: {result: nil, message: 'No data'}}
      end
    end
  end

  # POST /v1/book/import
  def import
    respond_to do |format|
      if Book.import(params[:file])
        format.json  { render json: :success }
        format.xml  { render xml: :success }
      else
        format.json  { render json: {result: :error}}
        format.xml  { render xml: {result: :error}}
      end
    end
  end


  # DELETE /v1/books/1
  def destroy
    book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :description, :cover_image, :price, :user_id)
    end

end
