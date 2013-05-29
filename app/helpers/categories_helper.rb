# coding: utf-8
module CategoriesHelper

  def display_categories(categories)
    tree = "<ul class='nav nav-list'>"
    for category in categories
      if category.parent_id == 0
        tree += "<li class='nav-header'>"
        tree += category.name
        tree += "</li>"
      end
    end
    tree += "</ul>"
    return tree.html_safe
  end

  def find_all_subcategories(category)
    tree = ''
    if category.children.size > 0
      category.children.each { |subcat|
        if subcat.children.size > 0
          tree += '<li>'
          tree += link_to h(subcat.name), :action => 'show', :id => subcat
          tree += find_all_subcategories(subcat)
          tree += '</li>'
        else
          tree += '<li>'
          tree += link_to h(subcat.name), :action => 'show', :id => subcat
          tree += '</li>'
        end
      }
      tree += ''
    end
    return tree
  end

end