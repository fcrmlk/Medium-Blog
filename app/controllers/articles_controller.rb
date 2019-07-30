class ArticlesController < ApplicationController

	before_action :set_article, only: [:edit,:update,:show,:destroy]
  before_action :check_user_is_logged_in?, only: [:new, :create]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = User.find(session[:user_id]).id
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render "new"
    end
  end

  def show
  end	

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated"
      redirect_to article_path(@article)
    else
      flash[:notice] = "Article was not updated"
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash.now[:success] = "Deleted Successfully."
    redirect_to articles_path
  end

  private 
  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
   @article = Article.find(params[:id])
  end

end