class CommentsController < ApplicationController
 
 
  def new 
   @comment = Comment.new 
  end
 
  def create
    @topic = Topic.find(params[:topic_id])
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to topic_path(@topic)
    else
      flash.now[:alert] = 'コメントを入力してください。'
    end
  end

  def destroy
   user = current_user
   comments = Comment.find_by(user_id: user.id, topic_id: params[:topic_id])
   comments.delete
   redirect_to comment_path, success: 'コメント削除しました'
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end
  
  
  
end
