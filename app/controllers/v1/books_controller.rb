class V1::BooksController < ApplicationController

  before_action :set_book, only: %i[ show update destroy ]

  # GET /v1/books.json
  # GET /v1/books.xml
  def index
    respond_to do |format|
      format.json { render(json: set_serializer(Book.all), status: :ok)}
      format.xml { render(xml: JSON.parse(set_serializer(Book.all)),skip_types: true)}
    end
  end

  # GET /v1/books/1
  def show
    respond_to do |format|
      format.json { render(json: set_serializer(@book), status: :ok)}
      format.xml { render(xml: JSON.parse(set_serializer(@book)),skip_types: true)}
    end
  end

  def set_serializer(book)
    BookSerializer.new(book,include:[:user]).serializable_hash.to_json
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
