class RemoveColumnFromIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :dish_id
  end
end
