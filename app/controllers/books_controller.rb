class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "成功"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash.now[:notice] = "失敗"
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user 
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
  end  
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.update(book_params)
    if @book.save
      flash[:notice] = "成功"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      flash.now[:notice] = "失敗"
      render :edit
    end
  end
    
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end