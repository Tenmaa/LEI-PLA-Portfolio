class User::UsersController < ApplicationController
  def show
    @user = current_user
    @user_comments = @user.comments
  end
  
  def edit
    @user = User.find(params[:id])  
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_user_path(@user.id)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end


  end
  
  def destroy
      @user = User.find(params[:id]) 
      @user.destroy
      flash[:notice] = 'ユーザーを削除しました。'
      redirect_to :root #削除に成功すればrootページに戻る
  end
  
  def destroy_comment
    @comment = Comment.find_by(rakuten_jan_code: params[:game_rakuten_jan_code].to_i)
    @comment.destroy
    redirect_to user_user_path(current_user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:profile_image,:email)
  end
end
