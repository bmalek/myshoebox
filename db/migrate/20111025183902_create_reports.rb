class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
