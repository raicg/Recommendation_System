class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.boolean :like

      t.timestamps
    end
  end
end
