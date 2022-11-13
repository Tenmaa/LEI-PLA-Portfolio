class Admin::HomesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_my_admin
  def top
    @users = User.all.filter { |user| user.email != 'guest@example.com' }
  end

private
 
  def user_params
    params.require(:user).permit(:name,:profile_image,:email)
  end
end
