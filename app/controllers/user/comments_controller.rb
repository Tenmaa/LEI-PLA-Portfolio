class User::CommentsController < ApplicationController
  def create
    result = RakutenWebService::Books::Game.search(jan: params[:game_rakuten_jan_code], outOfStockFlag: 1).first
    @game = Game.find_or_initialize_by(jan: result.jan)
    if @game.new_record?
      @game.title = result.title
      @game.maker = result['label']
      @game.release_date = result['salesDate']
      @game.image_url = result['largeImageUrl'].gsub('?_ex=200x200', '')
      @game.caption = result.item_caption
      @game.hardware = result.hardware
      @game.save!
    end

    @comment = current_user.comments.build(comment_params)
    @comment.game_id = @game.id
    @comment.rakuten_jan_code = params[:game_rakuten_jan_code]
    # params[:comment][:evaluation] で評価値を取得
    # comment.evaluationに評価値を代入
    #comment.evaluation = params[:comment][:evaluation]
    if @comment.save
      redirect_to user_game_path(params[:game_rakuten_jan_code])
    else
      @comments = @game.comments
      @game = result
      render 'user/games/show'
    end
  end
  
  def index
    redirect_to user_game_path(params[:game_rakuten_jan_code])
  end

  def destroy
    #@comment = Comment.find_by(rakuten_jan_code: params[:game_rakuten_jan_code].to_i)
    @comment = Comment.find(params[:id])
    
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to user_game_path(params[:game_rakuten_jan_code].to_i)
      
    else
      redirect_to root_path
    end
    
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :recommend_bgm, :evaluation, :review_star)
  end

end
