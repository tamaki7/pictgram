class CommentsController < ApplicationController
  def index
    @comment_topics = current_user.comment_topics
  end

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]
# TODO: フラッシュメッセージ ,ストロングパロメーターの検討
    if comment.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      redirect_to topics_path, danger: '投稿に失敗しました'
    end
  end
end
