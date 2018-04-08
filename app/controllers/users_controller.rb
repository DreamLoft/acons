class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  def index
    @users= User.all
  end
  def new
    @user = User.new
  end
  def create
      @user = User.new(user_params)
     respond_to do |format|
       if @user.save
         format.html { redirect_to users_path, notice: 'User was successfully created.' }
       else
         format.html { render :new }
      end
     end
  end

  private
  def authorize_admin
  return unless !current_user.user_type.eql?('admin')
  redirect_to root_path, alert: 'Admins only!'
end
def user_params
  params.require(:user).permit(:email, :password, :user_type)
end
end
