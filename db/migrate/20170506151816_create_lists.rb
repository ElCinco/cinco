class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.date :publish_date

      t.timestamps
    end
  end
end
