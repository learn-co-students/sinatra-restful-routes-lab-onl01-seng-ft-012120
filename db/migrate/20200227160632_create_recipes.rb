class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |z|
      z.string :name
      z.string :ingredients
      z.string :cook_time
    end
  end
end
