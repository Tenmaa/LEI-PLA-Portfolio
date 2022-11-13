class Admin::UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_my_admin
  def show
    #@user = User.find_by(id: params[:id])  
    @user = User.find(params[:id])  
    @user_comments = @user.comments
    #byebug
  end
  
  def destroy
      @user = User.find(params[:id]) 
      @user.destroy
      flash[:notice] = 'ユーザーを削除しました。'
      redirect_to admin_path 
  end
  
  def destroy_comment
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_user_path(@comment.user_id)

  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:profile_image,:email,)
  end
end
