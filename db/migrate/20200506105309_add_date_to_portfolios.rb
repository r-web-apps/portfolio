class AddDateToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :finished, :datetime
  end
end
