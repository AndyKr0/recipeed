class RecipesController < ApplicationController
  require 'open-uri'
  require 'nokogiri'

  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      @recipe.title = scrape(@recipe.url, "title")
      @recipe.user_name = "Default User"
      #@recipe.tag_names = "autotag1 autotag2 autotag3"
      @recipe.tag_names = scrape_ingredients(@recipe.url)
      render :edit, notice: 'Recipe initiated.'

    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  def update
    
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'Recipe was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  #Scrape URL
  def scrape(url, tag)
    doc = Nokogiri::HTML(open(url))
    return doc.css(tag).text.strip.chomp("Allrecipes.com").titleize.strip
  end
  
  #Scrape AllRecipes - this only works on allrecipes.com
  def scrape_ingredients(url)
    doc = Nokogiri::HTML(open(url))
    ingredient_list = doc.css('span#lblIngName')
    #strip commas from ingredient lists
    csv = ingredient_list.map(&:text).each do |i|
      i.delete!(',')
    end
    #add commas between array to popluate tags 
    return csv.join(',')
    
  end
  
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:url, :title, :user_name, :tag_names)
    end
end
