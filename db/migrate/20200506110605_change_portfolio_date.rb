class ChangePortfolioDate < ActiveRecord::Migration[6.0]
  def change
    remove_column :portfolios, :finished
    add_column :portfolios, :year, :integer
    add_column :portfolios, :month, :integer
  end
end
