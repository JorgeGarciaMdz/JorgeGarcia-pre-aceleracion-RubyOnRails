class CreateJwtDenylists < ActiveRecord::Migration[6.1]
  def change
    create_table :jwt_denylists do |t|
      t.datetime :exp
      t.string :jti

      t.timestamps
    end
  end
end
