class Recipe < ActiveRecord::Base
	attr_accessor :tag_names
	has_and_belongs_to_many :tags

  after_update :associate_tags
  #after_update :associate_tags_with_recipe
  

	private
	
	def associate_tags
    	if tag_names
     		tag_names.split(",").each do |name|
        		self.tags << Tag.find_or_create_by(name: name)
			end 
		end
	end
  
  def associate_tags_with_recipe
    if tag_names
      tags = tag_names.split(" ").map do |name|
        Tag.find_or_create_by(name: name)
      end
      self.recipe.tags += tags
      self.recipe.save
    end
  end
  
  
end


