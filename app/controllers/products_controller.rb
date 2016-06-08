class ProductsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
      @products = Product.all.order('created_at DESC')
      @products = @products.search(params[:city]) if params[:city].present?
    end

    def show
      #par rapport à la recherche
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to product_path(@product)
        else
            render :new
        end
    end
  #   ​
    def edit
    end
  # ​
    def update
        if @product.update(product_params)
          redirect_to product_path(@product)
        else
          render :edit
        end
    end
  #   ​
    def destroy
        @product.destroy
        redirect_to products_path
    end
  #   ​
  #
    private
  #
  #   ​
    def product_params
      params.require(:product).permit(:name, :address, :city, :country, :price, :begin_date, :end_date,:picture, :picture_cache)
    end
  #   ​
    def set_product
        @product = Product.find(params[:id])
    end

    def filtering_params(params)
      params.slice(:city, :begin_date, :end_date)
    end
  end
