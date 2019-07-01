class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :comments, as: :commentable
  has_many :votes, as: :voting

  validates :content, :title, presence: true

  def voted_by?(user)
    votes.exists?(user: user)
  end

  def self.question_search_by(search_term) 
    where(['LOWER(title) LIKE :search_term ', search_term: "%#{search_term.downcase}%"])
  end
end
