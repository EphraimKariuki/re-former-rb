class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # @user = User.new(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User added successfully"
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    params.expect(user: [ :username, :email, :password ])
  end
end
