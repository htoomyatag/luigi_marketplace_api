class V1::BooksController < ApplicationController
  before_action :set_v1_book, only: %i[ show update destroy ]

  # GET /v1/books
  def index
    @v1_books = V1::Book.all

    render json: @v1_books
  end

  # GET /v1/books/1
  def show
    render json: @v1_book
  end

  # POST /v1/books
  def create
    @v1_book = V1::Book.new(v1_book_params)

    if @v1_book.save
      render json: @v1_book, status: :created, location: @v1_book
    else
      render json: @v1_book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/books/1
  def update
    if @v1_book.update(v1_book_params)
      render json: @v1_book
    else
      render json: @v1_book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/books/1
  def destroy
    @v1_book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_book
      @v1_book = V1::Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def v1_book_params
      params.fetch(:v1_book, {})
    end
end
