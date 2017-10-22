class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end
	def index
	    @articles = Article.all
	    @admin = (user_signed_in? and current_user[:is_admin]==true)
	end
	def edit
		@article = Article.find(params[:id])
	end
	def show
    	@article = Article.find(params[:id])
    	@admin = (user_signed_in? and current_user[:is_admin]==true)
    	@signed = user_signed_in?
  	end
	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	 
	  redirect_to articles_path
	end
	def create  
		@article = Article.new(params.require(:article).permit(:title, :text))
	 	if @article.save
	  		redirect_to action: 'index'
	  	else
	  		render 'new'
	  	end
	end
	def update
	    @article = Article.find(params[:id])
	 
	    if @article.update(params.require(:article).permit(:title, :text))
	    	redirect_to @article
	    else
	    	render 'edit'
	  	end
	end
end
