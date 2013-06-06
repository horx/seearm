# coding: utf-8
class PagesController < ApplicationController

  def about
    @about = Page.where(:slug => 'about').first
    @contact = Page.where(:slug => 'contact').first
    @address = Page.where(:slug => 'address').first
    render_404 if @about.nil? || @contact.nil? || @address.nil?
    @on = 'about'
  end
end
