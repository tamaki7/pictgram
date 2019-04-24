class CommentsController < ApplicationController
  def index
    @comment_topics = current_user.comment_topics
  end

  def new
    @comment = Comment.new
    @comment.topic_id = params[:topic_id]
    @comment.user_id = session[:user_id]
end

  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]

# TODO: フラッシュメッセージ ,ストロングパロメーターの検討
# private
   def comment_params
     params.require(:comment).permit(:user_id, :topic_id, :description)
   end

    if comment.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      redirect_to topics_path, danger: '投稿に失敗しました'
    end
  end
end
