class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :rating
      t.string :company
      t.string :os
      t.text :review

      t.timestamps
    end
  end
end
