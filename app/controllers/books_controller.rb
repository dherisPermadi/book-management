class BooksController < ApplicationController
  before_action :find_book, only: [:show, :destroy, :edit, :update]

  def index
    @search = Book.search(params[:q])
    @search = @search.order(title: :asc).ransack(params[:q])
    @books  = @search.result(distinct: true).page(params[:page]).per(10)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to books_path
    else
      flash[:alert] = 'Book was not successfully created.'
      render :new
    end
  end

  def edit; end

  def update
    if @book.update(book_params)
      flash[:success] = "Book #{@book.title} was successfully updated."
      redirect_to books_path
    else
      flash[:alert] = "Book #{@book.title} was not successfully updated."
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = "Book #{@book.title} was successfully destroyed."
    else
      flash[:alert]   = "Book #{@book.title} was not successfully destroyed."
    end

    redirect_to books_path
  end

  private

  def find_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(
      :author_id, :content_name, :year, :category, :title, :average_rating, :pages, :description,
      :language, :release_date, genres: []
    )
  end
end
