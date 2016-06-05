class CreateFavorite < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :offset
      t.references :user, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
