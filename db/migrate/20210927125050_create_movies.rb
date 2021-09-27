class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :image
      t.string :title
      t.integer :qualification
      t.references :gender, null: false, foreign_key: true
      t.timestamp :delete_at

      t.timestamps
    end
    add_index :movies, :title
  end
end
