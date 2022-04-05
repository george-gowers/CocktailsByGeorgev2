class AddNameToCocktails < ActiveRecord::Migration[6.1]
  def change
    add_column :cocktails, :name, :string
  end
end
