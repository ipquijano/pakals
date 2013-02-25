class AdminController < ApplicationController
	def index
		if(current_user && current_user.usertype == "1")
		else	
			redirect_to log_in_path
		end
	end

	def viewAllUsers
		if(current_user && current_user.usertype == "1")
			@users = User.where("id != ?", current_user.id)
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
		
	end

	def spamComments
		
	end
end
