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

  # もっと短い記述をみつけたのでコメントアウト中
  # scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) } #今週
  scope :created_this_week, -> { where(created_at: Time.zone.now.all_week) } #今週

  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) } #先週

  scope :created_this_month, -> { where(created_at: Time.zone.now.all_month) } #今月

end
