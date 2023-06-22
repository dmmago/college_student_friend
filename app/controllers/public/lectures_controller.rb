class Public::LecturesController < ApplicationController
  def show
    @lecture = Lecture.find(params[:id])
    @lecture_row = @lecture.row
    @seats = @lecture.seats
    @seat = Seat.new
  end

  def index
    @lectures = Lecture.page(params[:page])
  end

  def create
    @seat = Seat.find(params[:seat_id])
    @seat.customer_id = current_customer.id
    @seat.save
  end
  
  def update
    @seat = Seat.find(params[:seat_id])
    
    @seat.update(customer_id:nil)
  end
end
