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
    	@emojis = Emoji.all
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
	def process_like
		if Like.where(user_id: params[:user_id],article_id: params[:article_id]).count == 0
			Like.create(
			article_id: params[:article_id],
			user_id: params[:user_id],
			emoji_id: params[:emoji_id]
			)
		else
			if Like.where(user_id: params[:user_id],article_id: params[:article_id],emoji_id: params[:emoji_id]).count == 1
				Like.where(user_id: params[:user_id],article_id: params[:article_id]).delete_all
			else 
				Like.where(user_id: params[:user_id],article_id: params[:article_id]).delete_all
				Like.create(
				article_id: params[:article_id],
				user_id: params[:user_id],
				emoji_id: params[:emoji_id]
				)
			end
		end
		redirect_to '/articles/' + params[:article_id] 
	end
end
