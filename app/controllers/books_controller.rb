class BooksController < ApplicationController
  before_action :set_book, only: [:show,:edit,:update,:destroy]
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to action: 'index'
      flash[:notice] = "ERmagerd you got new book"
    else
      render action:'new'
    end
  end
  def show
  end
  def edit
  end
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html{redirect_to @book, notice: 'Book was successfully updated.'}
        format.json {head :no_content}
      else
        format.html{render action 'edit'}
        format.json {render json: @book.errors, status: :unprocessable_entity}
      end
    end
  end
  private
  def set_book
    @book = Book.find(params[:id])
  end
  def book_params

    params.require(:book).permit(:title,:author,:publication_year,:isbn,:genre)
  end
end
