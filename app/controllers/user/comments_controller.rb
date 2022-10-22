class User::CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.rakuten_jan_code = params[:game_rakuten_jan_code].to_i
    # params[:comment][:evaluation] で評価値を取得
    # comment.evaluationに評価値を代入
    comment.evaluation = params[:comment][:evaluation]
    comment.save
    redirect_to user_game_path(params[:game_rakuten_jan_code])
  end

  def destroy
    @comment = Comment.find_by(rakuten_jan_code: params[:game_rakuten_jan_code].to_i)
    @comment.destroy
    redirect_to user_game_path(params[:game_rakuten_jan_code].to_i)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :recommend_bgm, :evaluation, :review_star)
  end

end
