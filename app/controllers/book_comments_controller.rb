class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comments_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
  end

  def destroy
    comment = BookComment.find_by(book_id: params[:book_id],id: params[:id])
    comment.destroy
  end

private
  def book_comments_params
    params.require(:book_comment).permit(:book_comments)
  end
end
