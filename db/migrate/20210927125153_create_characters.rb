class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :image
      t.string :name
      t.integer :age
      t.float :weight
      t.text :history
      #t.references :movie, null: false, foreign_key: true
      t.timestamp :delete_at

      t.timestamps
    end
    add_index :characters, :name

    create_table :characters_movies do |t|
      t.belongs_to :character
      t.belongs_to :movie
    end
  end
end
