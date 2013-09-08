class AddCategoryToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :category, :string
  end
end
