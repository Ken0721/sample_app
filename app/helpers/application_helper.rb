module ApplicationHelper
  def fulll_title(page_title = '') #define a method "full_title" and a arg
	base_title = "Ruby on Rails Tutorial Sample App" #initialize the var
	if page_title.empty? #check if the page_tile is empty
	  base_title  #use the var base_title if the var is empty
	else
	  page_title + "|" + base_title
	end
  end
end
