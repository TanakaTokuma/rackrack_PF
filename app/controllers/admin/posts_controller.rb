class Admin::PostsController < ApplicationController

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    #@book = Book.find(params[:id])
    #@comment = Post.find(params[:id])
    #@comment.destroy
    # binding.pry
    Post.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to request.referer
  end

end
