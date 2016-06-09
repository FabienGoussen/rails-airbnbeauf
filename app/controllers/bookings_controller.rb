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
      @booking = current_user.bookings.create(booking_params)
		  redirect_to @booking.product, notice: "Bien ouéj gro"
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

    def preload
  		product = Product.find(params[:product_id])
  		today = Date.today
  		bookings = product.bookings.where("begin_date >= ? OR end_date >= ?", today, today)
      render json: bookings
	   end

     def preview
    	begin_date = Date.parse(params[:begin_date])
    	end_date = Date.parse(params[:end_date])

    	output = {
    		conflict: is_conflict(begin_date, end_date)
    	}

    	render json: output
    end



    private

    def booking_params
      params.require(:booking).permit(:first_name, :address, :last_name, :begin_date, :end_date)
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end

    def is_conflict(begin_date, end_date)
   		product = Product.find(params[:product_id])

   		check = product.bookings.where("? < begin_date AND end_date < ?", begin_date, end_date)
   		check.size > 0? true : false
   	end
  end
