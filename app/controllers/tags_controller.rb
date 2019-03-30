class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
  end

  def destroy
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @tag.destroy
    redirect_to root
  end

end
