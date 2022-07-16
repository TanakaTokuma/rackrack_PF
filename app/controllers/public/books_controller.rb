class Public::BooksController < ApplicationController


  def create
    book = Book.new(book_params)
    
    book.save
    
    redirect_to books_path
  end

  def index
    # 振り分けるには
    # @read = Book.where(read_st: true)
    # @not_read　= Book.where(read_st: false)
    # みたいな感じ？
  end



  def search

    if params[:keyword].present? # keywordが入力されているかどうか確認
      @books = RakutenWebService::Books::Total.search(keyword: params[:keyword])
    end

  end

  private

  def book_params
    params.require(:book).permit(:image, :title, :author, :publisher, :saledate, :caption, :read_st)
  end


end
