class RemoveDescriptionFromCocktails < ActiveRecord::Migration[6.1]
  def change
    remove_column :cocktails, :description, :string
  end
end
