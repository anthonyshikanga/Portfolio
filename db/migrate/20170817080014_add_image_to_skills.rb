class AddImageToSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :image, :string
  end
end
