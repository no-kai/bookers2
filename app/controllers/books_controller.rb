class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to books_path
    else
      render :index
    end

  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @books = @user.books
  end

  def show

    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user

  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end


  def destroy
    book = Book.find(params[:id])
    if book.user == current_user
     book.destroy
     redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      flash[:notice] = 'Book was successfully update'
      redirect_to book_path(@book.id)
    else
      @book = book
      render :edit
    end

  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
