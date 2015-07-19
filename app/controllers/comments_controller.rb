class CommentsController < ApplicationController
  def create
    link = Link.find(params[:link_id])
    comment = link.comments.new(comment_params)

    unless comment.save
      flash[:errors] = comment.errors.full_messages
    end

    redirect_to link_url(link)
  end

  def destroy
    comment = Comment.find(params[:id])
    link = comment.link
    comment.destroy!
    redirect_to link_url(link)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
