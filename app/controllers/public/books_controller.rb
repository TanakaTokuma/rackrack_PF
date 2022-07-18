class Public::BooksController < ApplicationController

  before_action :authenticate_customer!


  def create
    book = Book.new(book_params)
    book.customer_id = current_customer.id
    book.save
    redirect_to books_path
  end

  def index

    # 読んだ本を@read_booksに追加
    @read_books = Book.where(read_st: true)
    # 読みたい本を@not_read_booksに追加
    @not_read_books = Book.where(read_st: false)

  end

  def show
    @book = Book.find(params[:id])
    @comment = Post.new
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def search
    if params[:keyword].present? # keywordが入力されているかどうか確認
      @books = RakutenWebService::Books::Total.search(keyword: params[:keyword])
    end
  end

  def category_search
    @book = Book.new
    @books = Book.search(params[:keyword])
    @read_books = @books.where(read_st: true)
    @not_read_books = @books.where(read_st: false)
    @category_name = Book.find(params[:keyword])
  end



  private

  def book_params
    params.require(:book).permit(:image_url, :title, :author, :publisher, :saledate, :category, :caption, :read_st)
  end


end
