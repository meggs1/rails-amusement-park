class RidesController < ApplicationController
  def create
    ride = Ride.new(ride_params)
    if ride.save
      response = ride.take_ride
      flash[:notice] = response
      redirect_to user_path(current_user)
    end
  end

  def ride_params
    params.require(:ride).permit(:attraction_id, :user_id)
  end
end
