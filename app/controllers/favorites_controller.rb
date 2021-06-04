class FavoritesController < ApplicationController
  def create
    @books = Book.all
    favorite = Favorite.new(book_id: book.id) #引数の設定✖︎
    favorite.save
    redirect_to books_path(@books)
  end

  def destroy
    @books = Book.all
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to books_path(@books)
  end
end
