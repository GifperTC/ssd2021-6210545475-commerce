class WelcomesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @search = params[:search]

    @products = Product.all
    @products = @products.where("title like ? or description like ?", "%#{@search}%", "%#{@search}%") if @search.present?
    @products = @products.page(params[:page]).per(5)
  end
end
