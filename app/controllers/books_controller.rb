class BooksController < ApplicationController
  def create
    @books = Book.all
    @book = Book.new
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(Book.last)
      flash[:notice] = 'Book was successfully created.'
      # Memo notice: 'Book was successfully created.'でも可。省略形。
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.new
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books', alert: 'Book was successfully destroyed.'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
