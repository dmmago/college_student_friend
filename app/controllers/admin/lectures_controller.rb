class Admin::LecturesController < ApplicationController
  def new

    @lecture = Lecture.new
    @seat = Seat.new
  end


  def show
  end

  def index
  end

  def create

    @lecture = Lecture.new(lecture_params)
    if @lecture.save
    @lecture.seating_capacity.times do
      Seat.create(lecture_id: @lecture.id)
    end
    end

  end



  private

  def lecture_params
    params.require(:lecture).permit(:lecture_name, :row, :col)
  end

  def seat_params
    params.require(:seat).permit(seat:[:lecture_id])
  end

end
