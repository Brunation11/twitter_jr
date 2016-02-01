class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
