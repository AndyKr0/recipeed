class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :url
      t.string :title
      t.string :user_name

      t.timestamps
    end
  end
end
