class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.belongs_to :user, index: true
      t.boolean :breakfast_included
      t.string :title
      t.string :room_description
      t.string :photo
      t.integer :price
      t.string :address

      t.timestamps
    end
  end
end
