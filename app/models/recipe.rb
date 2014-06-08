class Recipe < ActiveRecord::Base
	attr_accessor :tag_names
	has_and_belongs_to_many :tags

  before_update :associate_tags

	private
	
	def associate_tags
    	if tag_names
     		tag_names.split(" ").each do |name|
        		self.tags << Tag.find_or_create_by(name: name)
			end 
		end
	end
end


