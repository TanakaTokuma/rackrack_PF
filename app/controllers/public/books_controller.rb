class Public::BooksController < ApplicationController


  def create
    book = Book.new(book_params)

    book.save

    redirect_to books_path
  end

  def index

    # 読んだ本を@read_booksに追加
    @read_books = Book.where(read_st: true)
    # 読みたい本を@not_read_booksに追加
    @not_read_books = Book.where(read_st: false)

  end


  def search

    if params[:keyword].present? # keywordが入力されているかどうか確認
      @books = RakutenWebService::Books::Total.search(keyword: params[:keyword])
    end

  end

  private

  def book_params
    params.require(:book).permit(:image_url, :title, :author, :publisher, :saledate, :caption, :read_st)
  end


end
