class SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    
    if @range == "Book"
      @books = Book.search(params[:way],params[:keyword])
    else
      @users = User.search(params[:way],params[:keyword])
    end
    
  end
  
end
