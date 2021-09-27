class CreateGenders < ActiveRecord::Migration[6.1]
  def change
    create_table :genders do |t|
      t.string :name
      t.string :image
      t.timestamp :delete_at

      t.timestamps
    end
    add_index :genders, :name
  end
end
