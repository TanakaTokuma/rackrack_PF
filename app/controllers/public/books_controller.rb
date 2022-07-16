class Public::BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
  end
  
  
  
  
  
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :author, :publisher, :saledate, :caption)
  end
  
  
end
