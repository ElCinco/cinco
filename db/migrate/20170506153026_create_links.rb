class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
