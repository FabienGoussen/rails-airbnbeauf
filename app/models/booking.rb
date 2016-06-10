class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  def reserve!
    ActiveRecord::Base.transaction do
      if product_available?
        Booking.create(:product_id => @product.id, :user => current_user, :begin_date => params[:begin_date], :end_date => params[:end_date])
      else
        ''
      end
    end
  end

  def start_time
       self.Booking.begin_date ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
   end

  private

    def product_available?
      Booking.where(:product_id => @product.id, :begin_date => params[:begin_date], :end_date => params[:end_date]).exists?
    end

end
