class Portfolio < ApplicationRecord
  has_many :comments
  mount_uploader :picture, PortfolioPictureUploader
  mount_uploader :icon, PortfolioIconUploader
  validates :link_name, :link_href, presence: true, unless: :link_empty?

  def date
    "#{month}/#{year}"
  end

  private
  def link_empty?
    link_name.empty? && link_href.empty?
  end

end
