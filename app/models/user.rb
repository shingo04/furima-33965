class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :password_complexity
  
    def password_complexity
      # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
      return if password.blank? || password =~ /(?=.*?[a-z])(?=.*?[0-9])/

     errors.add :password, 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
    end
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
  validates :read_last_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :read_first_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/}
  validates :birth_date, presence: true
end
