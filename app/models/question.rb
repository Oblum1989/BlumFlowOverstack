class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :voting

  def voted_by?(user)
    votes.exists?(user: user)
  end
end
