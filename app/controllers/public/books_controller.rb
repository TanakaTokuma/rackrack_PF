class Public::BooksController < ApplicationController

  before_action :authenticate_customer!


  def create # 検索した本の登録
    book = Book.new(book_params)
    book.customer_id = current_customer.id
    # 重複確認
    # ログインしてるカスタマーに紐づいたBookの情報から.pluckでtitleだけ取り出して、.include?(book_para,s[:title])で登録しようとしてるtitleがあるか確認してる。
    # 最初の!で無かったらに意味が反転している。
    if !current_customer.books.pluck(:title).include?(book_params[:title])
      book.save
      redirect_to books_path
    else
      redirect_to request.referer, alert: "すでに登録済みです"
    end
  end

  def index

    # 読んだ本を@read_booksに追加
    @read_books = Book.where(read_st: true, customer_id: current_customer.id)
    # 読みたい本を@not_read_booksに追加
    @not_read_books = Book.where(read_st: false, customer_id: current_customer.id)

  end

  def show
    @book = Book.find(params[:id])
    @comment = Post.new
    @rate = Book.new
  end

  def update #読み終わったに
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
    # binding.pry
    @category_name = Book.find_by(category: params[:keyword])
  end



  private

  def book_params
    params.require(:book).permit(:image_url, :rakuten_url, :title, :author, :publisher, :saledate, :category, :caption, :read_st)
  end


end
