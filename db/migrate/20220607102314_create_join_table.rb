class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :dishes, :ingredients do |t|
      t.references :dishes, foreign_key: true
      t.references :ingredients, foreign_key: true
    end
  end
end
