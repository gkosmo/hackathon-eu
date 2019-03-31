class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def analytics
    @problem_countries = Problem.by_countries 
  end

  def dashboard 
    
  end
end
