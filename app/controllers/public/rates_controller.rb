class Public::RatesController < ApplicationController

  def create
    # binding.pry
    @rate = Book.find(rate_params[:id])
    @rate.rate = rate_params[:rate]
    # binding.pry
    @rate.save
    redirect_to book_path(@rate.id)
  end



  private

  def rate_params
    params.require(:book).permit(:rate, :id)
  end

end
