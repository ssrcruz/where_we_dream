class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :scholarship
      t.integer :rating

      t.timestamps null: false
    end
  end
end
