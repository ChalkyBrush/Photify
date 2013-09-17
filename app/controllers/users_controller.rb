class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
    @user.profile_picture = "http://www.faithlineprotestants.org/wp-content/uploads/2010/12/facebook-default-no-profile-pic.jpg"
    
  	if @user.save
  		redirect_to '/users/welcome' #:notice => "Signed up!"
  	else 
  		render :new
  	end
  end

  def welcome
  end

  # def show
  # 	@user = User.find(params[:id])
  # end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])

  	if @user.save
  		@user.update_attributes(user_params)
  		redirect_to "/users/#{@user.id}"
  	else
  		render "edit"
  	end
  end

  def user_params
  	params.require(:user).permit(:email, :first_name, :last_name, :profile_picture)
  end

end
