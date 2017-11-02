class AddNameToEmojis < ActiveRecord::Migration[5.1]
  def change
    add_column :emojis, :name, :string, unique: true
  end
end
