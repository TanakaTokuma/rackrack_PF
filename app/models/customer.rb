class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :posts, dependent: :destroy

  # emailとpasswordを生成
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      # SecureRandom.urlsafe_base64でランダムに64の文字数列を生成
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "ゲスト"
    end
  end

end
