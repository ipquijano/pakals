class PagesController < ApplicationController
	def home
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new 
	end

	def popular
		@posts = Post.order("spam_status ASC").limit(5)
	end

	def latest
		@posts = Post.order("created_at DESC").limit(5)
	end

	def towns
		
	end
end
