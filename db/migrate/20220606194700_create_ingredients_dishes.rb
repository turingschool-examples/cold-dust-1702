class CreateIngredientsDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients_dishes do |t|
      t.references :dishes, foreign_key: true
      t.references :ingredients, foreign_key: true

      t.timestamps
    end
  end
end
