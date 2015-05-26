class AddOrderIdToVerses < ActiveRecord::Migration
  def change
    add_column :verses, :order_id, :integer
  end
end
