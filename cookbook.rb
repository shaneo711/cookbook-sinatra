require "csv"
require_relative "recipe"

class Cookbook
  attr_reader :recipes

  def initialize(csv_file_path)
    @recipes = []
    @filepath = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  def create_imported_recipe(name, desc, rating, prep_time)
    Recipe.new(name, desc, rating, prep_time)
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def save_csv
    CSV.open(@filepath, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time]
      end
    end
  end

  def load_csv
    CSV.foreach(@filepath) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3])
    end
  end
end
