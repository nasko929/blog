class CreateEmojis < ActiveRecord::Migration[5.1]
  def change
    create_table :emojis do |t|
      t.string :url

      t.timestamps
    end
  end
end
