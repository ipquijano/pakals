class AdminController < ApplicationController
	def index
		if(current_user && current_user.usertype == "1")
		else	
			redirect_to log_in_path
		end
	end

	def viewAllUsers
		if(current_user && current_user.usertype == "1")
			@users = User.where("id != ?", current_user.id).paginate(:per_page => 5, :page => params[:page])
		else
			redirect_to log_in_path
		end
	end

	def ban 
		if(current_user && current_user.usertype == "1")
	    	@user = User.find(params[:id])    	
	      	if @user.update_attribute(:reputation,1)
				redirect_to admin_viewAllUsers_path, :notice => "User banned!"
			else
				render "index"
			end  
		else
			redirect_to log_in_path
		end
    end

    def unban
		if(current_user && current_user.usertype == "1")    	
	    	@user = User.find(params[:id])    	
	      	if @user.update_attribute(:reputation,0)
				redirect_to admin_viewAllUsers_path, :notice => "User unbanned!"
			else
				render "index"
			end  
		else
			redirect_to log_in_path
		end
   	end

   	def promote
		if(current_user && current_user.usertype == "1")   		
	   		@user = User.find(params[:id])    	
	      	if @user.update_attribute(:usertype,1)
				redirect_to admin_viewAllUsers_path, :notice => "User promoted to admin!"
			else
				render "index"
			end  
		else
			redirect_to log_in_path
		end
   	end

   	def demote
		if(current_user && current_user.usertype == "1")
	   		@user = User.find(params[:id])    	
	      	if @user.update_attribute(:usertype,0)
				redirect_to admin_viewAllUsers_path, :notice => "User demoted to as regular user!"
			else
				render "index"
			end 
		else
			redirect_to log_in_path
		end 
   	end

	def spamReports
		@posts = Post.paginate(:per_page => 5, :page => params[:page])
	end

	def showPostsReporters
		@post = Post.find(params[:id])
		@flaggings = @post.flaggings
		#user = flagging.flagger
		#@spams = SpamPost.where(:post_id => @post.id)					
	end

	def spam
		@post = Post.find(params[:id])
		if @post.update_attribute(:reputation, 1)
			redirect_to admin_spamReports_path, :notice => "Post marked as spam!"
		else
			redirect_to admin_spamReports_path
		end
	end

	def unspam
		@post = Post.find(params[:id])
		if @post.update_attribute(:reputation, 0)
			redirect_to admin_spamReports_path, :notice => "Post unmarked as spam!"
		else
			redirect_to admin_spamReports_path
		end
	end

	def spamComments
		
	end
end
