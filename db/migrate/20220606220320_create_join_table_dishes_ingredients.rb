class CreateJoinTableDishesIngredients < ActiveRecord::Migration[5.2]
  def change
    create_join_table :dishes, :ingredients, table_name: :dish_ingredients do |t|
       t.index [:dish_id, :ingredient_id]
       t.index [:ingredient_id, :dish_id]
    end
  end
end
