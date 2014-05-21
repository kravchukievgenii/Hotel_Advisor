class CommentsController < ApplicationController
  def create
    @comment = Comment.new comment_params
    @comment.save
    redirect_to @comment.hotel
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :hotel_id)
  end
end
