class RenamePk < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :portfolios_id, :portfolio_id if column_exists? :comments, :portfolios_id
  end
end
