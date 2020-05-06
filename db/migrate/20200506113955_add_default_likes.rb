class AddDefaultLikes < ActiveRecord::Migration[6.0]
  def change
    change_column :portfolios, :likes, :integer, :default => 0
  end
end
