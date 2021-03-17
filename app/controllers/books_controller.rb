class BooksController < ApplicationController
  def index
    @books = Book.all.order("id ASC")
  end
end
