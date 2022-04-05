class AddEmailToCocktails < ActiveRecord::Migration[6.1]
  def change
    add_column :cocktails, :email, :string
  end
end
