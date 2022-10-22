class Admin::HomesController < ApplicationController
  def top
    @users = User.all
  end

private
 
  def user_params
    params.require(:user).permit(:name,:profile_image,:email)
  end
end
