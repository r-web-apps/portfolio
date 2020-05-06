class Portfolio < ApplicationRecord
  has_many :comments
  mount_uploader :picture, PortfolioPictureUploader
  mount_uploader :icon, PortfolioIconUploader

  def date
    "#{month}/#{year}"
  end
end
