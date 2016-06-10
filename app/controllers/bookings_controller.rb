class BookingsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index
    before_action :set_booking, only: [:show, :edit, :update, :destroy]
    before_filter :load_product

    def index
      @bookings = @product.bookings
    end

    def new
      @booking = @product.bookings.build
    end

    def create
      booking = Booking.new({:user_id => current_user.id, :product_id => booking_params[:product_id], :price => booking_params[:price], :begin_date => booking_params[:begin_date], :end_date => booking_params[:end_date]})
      if booking.save
        flash[:notice] = "Success!"
        redirect_to '/'
      else
        flash[:alert] = "Failure!"
        render :new
      end
    end

    def show
      #par rapport la recherche
    end

    def edit
    end

    def update
      if @booking.update(booking_params)
        redirect_to product_path(product.id)
      else
        render :edit
      end
    end

    def destroy
      @booking.destroy
      redirect_to products_path
    end

    private

    def load_product
      @product = Product.find params[:product_id]
    end

    def booking_params
      params.require(:booking).permit(:price, :user_id, :product_id :begin_date, :end_date)
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end
  end
