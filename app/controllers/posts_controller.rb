class PostsController < ApplicationController

	def index
		@posts = Post.all		
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new 
	end

	def new 
		if(current_user)
			@post = Post.new
		else
			redirect_to log_in_path
		end
	end

	def create

		if(current_user) 
			@post = Post.new(params[:post])

			if @post.save
				redirect_to posts_path, :notice => "Posted!"
			else
				render "new"
			end
		else
			redirect_to log_in_path
		end
	end

	def edit
		if(current_user) 
			@post = Post.find(params[:id])		
		else
			redirect_to log_in_path
		end
	end

	def update
		if(current_user) 
			@post = Post.find(params[:id])

			if @post.update_attributes(params[:post])
				redirect_to posts_path, :notice => "Updated Post!"
			else
					render "edit"
			end  
		else
			redirect_to log_in_path
		end
	end

	def destroy
		if(current_user) 
			@post = Post.find(params[:id])
			@post.destroy
			redirect_to view_posts_path
		else
			redirect_to log_in_path
		end
	end

	def view_posts
		if(current_user) 
			@posts = Post.find_all_by_user_id(current_user.id)
		else
			redirect_to log_in_path
		end
	end

	def town_posts
		@posts = Post.where("town_from = ?", params[:town_from])


	end

	
end
