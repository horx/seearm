# coding: utf-8
class HomeController < ApplicationController
  
  def index
    @on = 'home'
    @position_one = Position.where('location = 1').order('updated_at DESC')
    @position_two = Position.where('location = 2').limit(8).order('updated_at DESC')
    @position_three = Position.where('location = 3').limit(8).order('updated_at DESC')
  end

end
