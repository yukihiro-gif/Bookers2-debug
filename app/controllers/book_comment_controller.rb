class PostCommentController < ApplicationController
  def create
  end

  def destroy
  end


   private

  def bookt_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
