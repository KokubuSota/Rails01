class CommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to topic_path(@topic)
    else
      flash.now[:alert] = 'コメントを入力してください。'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end
  
end
