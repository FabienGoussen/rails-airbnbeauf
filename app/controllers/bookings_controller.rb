class BookingController < ApplicationController
    skip_before_action :authenticate_user!, only: :index
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

    def index
      @bookings = @product.bookings
    end

    def new
      @booking = @product.bookings.build
    end

    def create
      @booking = @product.bookings.build booking_params
      if @booking.save
        'success'
      else
        'fail'
      end
    end

    # def show
    #   #par rapport la recherche
    # end
    #
    # def edit
    # end
    #
    # def update
    #   if @booking.update(booking_params)
    #     redxirect_to product_path(product.id)
    #   else
    #     render :edit
    #   end
    # end
    #
    # def destroy
    #   @booking.destroy
    #   redirect_to products_path
    # end

    private

    def booking_params
      params.require(:booking).permit(:first_name, :address, :last_name, :begin_date, :end_date)
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end
  end
