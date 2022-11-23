class AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :destroy, :edit, :update]

  def index
    @search  = Author.all.order(name: :asc).ransack(params[:q])
    @authors = @search.result(distinct: true).page(params[:page]).per(10)
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      flash[:success] = 'Author was successfully created.'
      redirect_to authors_path
    else
      flash[:alert]   = 'Author was not successfully created.'
      render :new
    end
  end

  def edit; end

  def update
    if @author.update(author_params)
      flash[:success] = "Author #{@author.name} was successfully updated."
      redirect_to authors_path
    else
      flash[:alert]   = "Author #{@author.name} was not successfully updated."
      render :edit
    end
  end

  def destroy
    if @author.destroy
      flash[:success] = "Author #{@author.name} was successfully destroyed."
    else
      flash[:alert]   = "Author #{@author.name} was not successfully destroyed."
    end

    redirect_to authors_path
  end

  private

  def find_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(
      :name, :gender, :n_books, :summary, :born, :died
    )
  end
end
