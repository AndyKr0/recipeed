class TagsController < ApplicationController
  
  def remove
    @recipe = Recipe.find(params[:recipe_id])
    #if can?(:tag, @recipe)
    @tag = Tag.find(params[:id])
      @recipe.tags -= [@tag]
    @recipe.save
    #render nothing: true
    #redirect_to edit_recipe_path(@recipe), :notice => "Successfully deleted tag."
    redirect_to :back, :notice => "Successfully deleted tag."
        
  end
  
end
