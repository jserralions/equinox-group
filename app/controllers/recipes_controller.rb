class RecipesController < ApplicationController

  expose(:recipes)
  expose(:recipe)

  # GET /recipes
  def index
  end

  # GET /recipes/1
  def show
  end

  # GET /recipes/new
  def new
    authorize recipe
  end

  # GET /recipes/1/edit
  def edit
    authorize recipe
    recipe.recipe_items
  end

  # POST /recipes
  def create
    recipe = Recipe.new(recipe_params)
    recipe.user = current_user
    if recipe.save
      redirect_to recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  def update
    recipe = Recipe.find(params[:id])
    authorize recipe
    if recipe.update(recipe_params)
      redirect_to recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipes/1
  def destroy
    authorize recipe
    recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:name, :category,
                                     recipe_items_attributes: [:measure, :amount,
                                     ingredient_attributes: [:name]])
    end
end
