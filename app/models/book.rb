class Book < ApplicationRecord

  # imageにurlが入らないらしいので、コメントアウト中
  # has_one_attached :image

  belongs_to :customer
  has_many :posts, dependent: :destroy

  def self.search(keyword)
    Book.where(['category LIKE ?', "#{keyword}"])
  end

  # 投稿数を表示するメソッド
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } #今日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } #昨日

end
