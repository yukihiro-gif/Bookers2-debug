class FavoritesController < ApplicationController
  before_action :book_params

  def create
    @books = Book.all
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id) #引数の設定✖︎
    favorite.save
  end

  def destroy
    @books = Book.all
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
  end

  private
  def book_params
   @book = Book.find(params[:book_id])
  end
end
