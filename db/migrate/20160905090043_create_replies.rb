class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
      t.string :name
      t.text :reply

      t.timestamps
    end
  end
end
