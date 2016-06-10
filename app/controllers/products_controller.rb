class ProductsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index
    before_action :set_product, only: [:show, :edit, :update, :destroy]

     # geocoded_by :address
     # after_validation :geocode, if: :address_changed?

  def index
    @products = Product.all.order('created_at DESC')
    @products = @products.city_search(params[:city]).begin_date_search(params[:end_date]).end_date_search(params[:begin_date]) if params[:city].present? || params[:end_date].present? || params[:begin_date].present?
     @markers = Gmaps4rails.build_markers(@products) do |flat, marker|
    marker.lat flat.latitude
    marker.lng flat.longitude
  end
  end



  def show
    @review = Review.new  # <-- You need this now.
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

  def book_product
   if @product.bookings.where("begin_date < ? AND end_date > ?, params[:begin_date], params[:end_date]").validate = "no"
     # alert("Already booked")
   else
     Booking.create!(product_id: @product.id, user_id: current_user.id, begin_date: params[:begin_date], end_date: params[:end_date])
   end
   # start_date = params[:start_date].to_date.beginning_of_day
   # end_date = params[:end_date].to_date.end_of_day
   # records = Campaign.where(:created_at => start_date..end_date)
   end

    private
  #
  #   ​
    def product_params
      params.require(:product).permit(:name, :address, :city, :country, :price, :begin_date, :end_date,:picture, :picture_cache, :description)
    end
  #   ​
    def set_product
        @product = Product.find(params[:id])
    end

    def filtering_params(params)
      params.slice(:city, :begin_date, :end_date)
    end
  end
