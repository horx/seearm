# coding: utf-8
class HomeController < ApplicationController
  
  def index
    @on = 'home'
    @position_three = Position.where('location = 3').limit(4).order('updated_at DESC')
  end

end
