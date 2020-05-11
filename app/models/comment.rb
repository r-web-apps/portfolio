class Comment < ApplicationRecord
  belongs_to :portfolio
  validates :body, length: {:minimum => 5, maximum: 3000}
end
