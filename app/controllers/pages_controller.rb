class PagesController < ApplicationController
	def popular
		@posts = Post.all
	end

	def latest
		@posts = Post.order("created_at DESC").paginate(:per_page => 5, :page => params[:page])
	end
	
end
