class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.authenticate(params[:email], params[:password])
	if user
		if user.reputation == 1
			flash.now.alert = "Banned User!"
			render "new"
	  	else
			session[:user_id] = user.id
			redirect_to posts_path, :notice => "Welcome " + user.name + "!"
		end
	else
		flash.now.alert = "Invalid email or password"
		render "new"
	end
  end

  def destroy
	session[:user_id] = nil
	redirect_to root_url
  end

end
