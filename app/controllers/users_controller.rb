class UsersController < ApplicationController
	before_action :set_user
	before_action :require_login

  def edit
  end

  def update
  	@user.update(user_params)
  	if @user.save
  		redirect_to user_path(current_user)
  	else
  		render :edit
  	end
  end

  def show
  end

  def destroy
  	@user.destroy
  	redirect_to sign_up_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:email, :image)
  end

end
