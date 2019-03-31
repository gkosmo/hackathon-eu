class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to problems_url if current_user
  end

  def analytics
    @problem_countries = Problem.by_countries 
    @pie_data = Category.all.map{ |cate|  [ cate.title, cate.problems.count] }
  end

  def dashboard 
   
  end
end
