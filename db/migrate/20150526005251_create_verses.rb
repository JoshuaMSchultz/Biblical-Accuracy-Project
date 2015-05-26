class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.integer :vote_count
      t.references :chapter, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
