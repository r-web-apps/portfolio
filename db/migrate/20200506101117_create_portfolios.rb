class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.text :body
      t.string :picture
      t.string :icon
      t.integer :likes

      t.timestamps
    end
  end
end
