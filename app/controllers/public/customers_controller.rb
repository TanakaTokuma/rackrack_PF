class Public::CustomersController < ApplicationController

  def show
    # current_customerに関連付けられた投稿を全て@booksに
    @books = current_customer.books
    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
  end


end
