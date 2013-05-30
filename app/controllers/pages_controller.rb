# coding: utf-8
class PagesController < ApplicationController

  def contact
    @contact = Pages.where('slug = contact')
  end

end
