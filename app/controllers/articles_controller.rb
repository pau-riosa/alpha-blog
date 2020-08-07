class ArticlesController < ApplicationController
  # params (short for parameter) it's a hash data structure
  def show
    # byebug debugging tool
    # article = Article.find(params[:id])
    # to access the object we need to instantiate to another variable
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      flash[:alert] = "Article was not created."
      render "new"
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.required(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      flash[:alert] = "Alert was not updated."
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end
end
