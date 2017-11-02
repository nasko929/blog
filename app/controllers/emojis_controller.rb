class EmojisController < ApplicationController
	def new
		@emoji = Emoji.new
	end
	def index
		@emojis = Emoji.all
	end
	def edit
		@emoji = Emoji.find(params[:id])

	end
	def show
		@emoji = Emoji.find(params[:id])
	end
	def destroy
		@emoji = Emoji.find(params[:id])
		@emoji.destroy

		redirect_to emojis_path
	end
	def create
		@emoji = Emoji.new(params.require(:emoji).permit(:url,:name))
		if @emoji.save
			redirect_to action: 'index'
		else
			render 'new'
		end
	end
	def update
		@emoji = Emoji.find(params[:id])
	 
	    if @emoji.update(params.require(:emoji).permit(:url,:name))
	    	redirect_to @emoji
	    else
	    	render 'edit'
	  	end
	end
end
