class ChangeImageToMessages < ActiveRecord::Migration[5.0]
  def change

    def up
      change_column :messages, :image, :string
    end

    def down
      change_column :messages, :image, :string, null: false
    end

  end
end