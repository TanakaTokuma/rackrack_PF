class Public::PostsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_customer.posts.new(post_params)
    @comment.book_id = @book.id
    @comment.score = Language.get_data(post_params[:comment])
    if @comment.save
      redirect_to request.referer
    else
      redirect_to request.referer, alert: "内容を入力して下さい"
    end
  end


  def destroy
    Post.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to request.referer
  end



  private


  def post_params

    params.require(:post).permit(:comment)

  end
end
