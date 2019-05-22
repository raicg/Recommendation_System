class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :genre
      t.string :company
      t.string :image
      t.string :yearLastSeason

      t.timestamps
    end
  end
end
