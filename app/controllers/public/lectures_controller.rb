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
    if @seat.save
      flash[:notice] = '座席を登録しました'
      redirect_back(fallback_location: root_url)
    else
      flash[:alert] = 'すでに座席登録済みです'
      redirect_back(fallback_location: root_url)
    end
  end
  
  def update
    @seat = Seat.find(params[:seat_id])
    @seat.customer_id = nil
    @seat.save!(validate: false)
    flash[:notice] = '座席情報を削除しました'
    redirect_back(fallback_location: root_url)
  end
end
