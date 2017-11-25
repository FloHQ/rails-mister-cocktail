require 'faker'

class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)

    redirect_to cocktail_path(@cocktail)
  end

  # def destroy
  # end

  def mixologist
    @cocktail = Cocktail.new(name: Faker::Hipster.words(2).join(" ").capitalize)
    @cocktail.save!
    ingredient_range = set_ingredient_range.to_a
    [3, 4, 5, 6, 7].sample.times do
      desc = ["1cl", "1.5cl" "2cl", "2.5cl", "3cl", "3.5cl", "4cl", "4.5cl", "5cl", "5.5cl", "6cl", "1 drop", "2 drops"]
      @dose = Dose.new(description: desc.sample, ingredient_id: ingredient_range.sample)
      @dose.cocktail = @cocktail
      @dose.save
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_ingredient_range
    (Ingredient.first.id..Ingredient.last.id)
  end
end
