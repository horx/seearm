# coding: utf-8
class PagesController < ApplicationController

  def about
    @page = Page.where(:slug => 'about').first
    render_404 if @page.nil?
    @on = 'about'
  end
end
