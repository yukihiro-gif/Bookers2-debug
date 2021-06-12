class SearchsController < ApplicationController
  def serch
    @range = params[:range]
    @word = params[:word]
    @method = params[:method]

    if  @range == "user"
     @users = User.search(@method,@word)
    else
     @books = Book.search(@method,@word)
    end
  end
end
