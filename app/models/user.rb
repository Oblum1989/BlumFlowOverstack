class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :answers
  has_many :comments

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :email, uniqueness: true
  validates :password, presence: true

  def username
    self.email.split('@')[0]
  end
  
end
