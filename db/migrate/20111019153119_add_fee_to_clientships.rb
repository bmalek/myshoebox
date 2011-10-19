class AddFeeToClientships < ActiveRecord::Migration
  def change
    add_column :clientships, :fee, :string
  end
end
