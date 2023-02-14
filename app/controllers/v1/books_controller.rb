class V1::BooksController < ApplicationController
  require_relative '../helpers/book_helper'
  include BookHelper
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
    book = Book.new(book_params)

    if book.save
      render json: book, status: :created, location: book
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/books/1
  def update
    if book.update(book_params)
      render json: book
    else
      render json: book.errors, status: :unprocessable_entity
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
      params.fetch(:book, {})
    end
end
