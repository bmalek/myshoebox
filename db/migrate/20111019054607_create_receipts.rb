class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :type
      t.string :title
      t.string :amount
      t.text :description
      t.date :issued_at

      t.timestamps
    end
  end
end
