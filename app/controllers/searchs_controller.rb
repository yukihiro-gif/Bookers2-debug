class SearchsController < ApplicationController
  def serch
    @range = params[:range]
    @word = params[:word]

    if  @range == "user"
     @users = User.search(params[:method],params[:word])
    else
     @books = Book.search(params[:method],params[:word])
    end
  end
end
