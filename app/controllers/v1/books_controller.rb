class V1::BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]


  # GET /v1/books
  def index
    @books = Book.all.to_json(
      except: [:user_id, :created_at,:updated_at],
      include:{user:{only:[:author_pseudonym]}})
    data = JSON.parse(@books)
    respond_to do |format|
        format.xml { render(xml: data,skip_types: true)}
        format.json { render(json: JSON.pretty_generate(data))}
    end
  end

  # GET /v1/books/1
  def show
    render json: book
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
      book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.fetch(:book, {})
    end
end
