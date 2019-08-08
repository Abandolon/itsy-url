class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :original
      t.string :custom_short
      t.integer :clicked
      t.datetime :last_clicked
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
