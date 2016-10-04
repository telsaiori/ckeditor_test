class CreateGuestbooks < ActiveRecord::Migration[5.0]
  def change
    create_table :guestbooks do |t|
      t.string :name
      t.text :post

      t.timestamps
    end
  end
end
