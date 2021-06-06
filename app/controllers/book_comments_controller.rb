class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(book_comments_params)
    comment.user_id = current_user.id
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)

  end

  def destroy
    comment = BookComment.find_by(book_id: params[:book_id],id: params[:id])
    comment.destroy
    redirect_to book_path(params[:book_id])
  end

private
  def book_comments_params
    params.require(:book_comment).permit(:book_comments)
  end
end
