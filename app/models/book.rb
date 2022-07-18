class Book < ApplicationRecord

  # imageにurlが入らないらしいので、コメントアウト中
  # has_one_attached :image

  belongs_to :customer
  has_many :posts, dependent: :destroy

  def self.search(keyword)
    Book.where(['category LIKE ?', "#{keyword}"])
  end

end
