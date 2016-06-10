class BookingsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index
    before_action :set_booking, only: [:show, :edit, :update, :destroy]

    def index
      @bookings = Booking.all
    end

    def show
      #par rapport la recherche
    end

    def new
      @booking = Booking.new
    end

    def create
      @booking = Booking.new(booking_params)
      if @booking.save
          redirect_to product_path(product.id)
      else
          render :new
      end
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

    def booking_params
      params.require(:booking).permit(:first_name, :address, :last_name, :begin_date, :end_date)
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end
  end
