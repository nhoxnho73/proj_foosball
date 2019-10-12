class UsersController < ApplicationController
  before_action :set_params, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  

  def create
    unless valid_team?
      redirect_to new_user_path, alert: 'The chosen team is already full'
      return
    end

    @user = User.create(users_params)
    redirect_to  users_path, notice: 'Successfull !'
  end

  def update
    unless valid_team?
      redirect_to new_user_path(@user), alert: 'The chosen team is already full'
      return
    end
    @user.update(users_params)
    redirect_to users_path, notice: 'Successfull !'
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Successfull !'
  end
  
  
  private
    def set_params
      @user = User.find(params[:id])
    end
    
    def valid_team?
      return true if params[:user][:team_id] == ''
      return false if params([:user][:team_id]).users.count >=2
    end

    def users_params
      params.require(:user).permit(:first_name, :last_name, :team_id)
    end
    

end