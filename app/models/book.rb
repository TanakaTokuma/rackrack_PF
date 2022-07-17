class Book < ApplicationRecord
  
  # imageにurlが入らないらしいので、コメントアウト中
  # has_one_attached :image

  has_many :posts

end
