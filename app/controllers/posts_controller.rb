class PostsController < ApplicationController
	
	def index
		@posts = Post.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
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
				redirect_to view_posts_path, :notice => "Posted!"
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
		if current_user
			@post = Post.find(params[:id])
			if @post.update_attributes(params[:post])
				redirect_to view_posts_path, :notice => "Updated Post!"
			else
				render "edit"
			end  
		else
			redirect_to log_in_path
		end
	end

	def destroy
		if current_user
			@post = Post.find(params[:id])
			@post.destroy
			redirect_to view_posts_path
		else
			redirect_to log_in_path
		end
	end

	def view_posts
		if current_user
			@posts = Post.where(:user_id => current_user.id).paginate(:per_page => 3, :page => params[:page])
		else
			redirect_to log_in_path
		end
	end

	def town_posts
		@posts = Post.where("town_from = ?", params[:town_from])
	end

	def mark_spam
		@post = Post.find(params[:id])   		
		if current_user.flagged?(@post, :spam)
			current_user.unflag(@post, :spam)
			redirect_to @post, :notice => "Post unmarked as spam!" 
		else
			current_user.flag(@post, :spam)
			redirect_to @post, :notice => "Post marked as spam!" 
		end		
	end

	def like
		@post = Post.find(params[:id])   		
		if current_user.flagged?(@post, :like)
			current_user.unflag(@post, :like)
			redirect_to @post, :notice => "You unliked the post!" 
		else
			current_user.flag(@post, :like)
			redirect_to @post, :notice => "You liked the post!" 
		end		
	end
		
end
