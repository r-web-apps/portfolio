class AddLinksToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :link_href, :string
    add_column :portfolios, :link_name, :string
  end
end
