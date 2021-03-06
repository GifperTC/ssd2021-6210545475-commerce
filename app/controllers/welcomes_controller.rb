class WelcomesController < ApplicationController

  def index
    @search = params[:search]
    @products = Product.all
    @products = @products.where("title like ? or description like ?", "%#{@search}%", "%#{@search}%") if @search.present?
    @products = @products.page(params[:page]).per(5)
  end

  def show
    @product = Product.find(params[:id])
  end
end
