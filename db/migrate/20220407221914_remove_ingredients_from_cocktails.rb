class RemoveIngredientsFromCocktails < ActiveRecord::Migration[6.1]
  def change
    remove_column :cocktails, :ingredients, :string
  end
end
