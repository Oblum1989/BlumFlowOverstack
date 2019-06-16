class Vote < ApplicationRecord
  belongs_to :voting, polymorphic: true
  belongs_to :user
end
