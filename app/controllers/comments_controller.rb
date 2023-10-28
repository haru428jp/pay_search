class CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    if @comment.save
      redirect_to spot_path(@comment.spot)
    else
      @spot = @comment.spot
      @comments = @spot.comments.includes(:user)
      render "spots/show", status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, spot_id: params[:spot_id])
  end

end
