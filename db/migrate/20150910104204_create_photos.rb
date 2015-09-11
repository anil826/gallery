class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.string :imageable_id
      t.string :imageable_type
      t.references :album, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
