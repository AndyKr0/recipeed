#Recipeed

##1st Implementation, Single user

1. Paste recipe URL
	- Pull <title> to auto fill into form (mechanize? piso?)
2. Save URL to account
3. Display... 
 	- All recipes by title (Masonry gem??)
 	- Single recipe
 		- Display <body> of source URL


##Tables/Models
- ###Recipes
	- Recipe Name
	- Source URL
	- **Source domain** (All Recipies, Food Network, etc.)
	- Picture
	- **Ingredients with quantities**
	
- ###Tags
	- **Ingredients**

- ###Domains
	- Domain

- ###Ingredients
	- Ingrediant
	- Quantity
	- Recipe


##2nd Implementation
	1. Paste recipe URL
	2. Build parseing logic -
		- Attempt to parse html for recipe info and save to records
			- Find recipe name
			- Find recipe photo
			- Find recipe ingredients
			- Find ingredient quantities
	3. Display... 
		- All Recipies (Masonry gem??)
 		- Single Recipe
 			- Simple ingredient list
 			- Picture
 			- Tags
 			- Instructions/source URL content


##3rd Implementation
	1. Get URL from bookmarklet
	2. Add user model


