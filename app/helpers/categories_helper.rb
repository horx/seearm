module CategoriesHelper

  def display_categories(categories)
    tree = '<ul class="top">'
    for category in categories
      if category.parent_id == 0
        tree += '<li class="nav-header">'
        tree += link_to category.name
        tree += find_all_subcategories(category)
        tree += '</li>'

      end
    end
    tree += '</ul>'
  end

  def find_all_subcategories(category)
      category.children.each { |subcat|
          tree += '<li>'
          tree += link_to h(subcat.name), :action => 'show', :id => subcat
          tree += '</li>'
      }
  end

end