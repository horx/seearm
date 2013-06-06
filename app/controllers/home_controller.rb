# coding: utf-8
class HomeController < ApplicationController
  
  def index
    @on = 'home'
    @position_one = Position.where('location = 1').limit(4).order('updated_at DESC')
    @position_two = Position.where('location = 3').limit(4).order('updated_at DESC')
    @position_three = Position.where('location = 3').limit(4).order('updated_at DESC')
  end

end
