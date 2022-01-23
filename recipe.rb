class Recipe
  attr_reader :name, :description, :rating, :marked_done, :prep_time

  def initialize(name, description, rating, prep_time)
    @name = name
    @description = description
    @rating = rating
    @marked_done = false
    @prep_time = prep_time
  end

  def mark_as_done
    @marked_done = true
  end
end
