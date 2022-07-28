class Public::CustomersController < ApplicationController

  def show
    # current_customerに関連付けられた投稿を全て@booksに
    @books = current_customer.books
    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week
    @this_month_book = @books.created_this_month
  end


end
