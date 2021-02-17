class InstantNoodleTimesController < ApplicationController
  def show
    time = InstantNoodleGenerator.perform(params[:instant_noodle_time_id], params[:hourglass1_id], params[:id])

    render json: { preparation_time: time }
  end
end