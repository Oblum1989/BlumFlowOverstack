class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :voting

  validates :content, presence: true

  def voted_by?(user)
    votes.exists?(user: user)
  end
end
