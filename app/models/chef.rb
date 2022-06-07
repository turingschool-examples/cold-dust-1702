class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def chef_ingredients
    dishes.joins(:ingredients).distinct.pluck("ingredients.name")
  end

  def top_3_ingredients
    dishes.joins(:ingredients)
          .select("ingredients.*, count(ingredients.id)") 
          .group("ingredients.id")  
          .order(count: :desc)
          .limit(3)
          .pluck("ingredients.name")
  end

end
