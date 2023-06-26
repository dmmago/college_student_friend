class Admin::LecturesController < ApplicationController
  before_action :authenticate_admin!
  def new
    @lecture = Lecture.new
    @seat = Seat.new
  end


  def index
    @lectures = Lecture.page(params[:page])
  end

  def create

    @lecture = Lecture.new(lecture_params)
    if @lecture.save
    @lecture.seating_capacity.times do
      Seat.create(lecture_id: @lecture.id)
      end
      flash[:notice] = "教室を作成しました"
      redirect_to admin_lectures_path
    else
      render :new
    end
  end
  
  def destroy
    lecture = Lecture.find(params[:id])
    lecture.destroy
    flash[:notice] = "教室を削除しました"
    redirect_to admin_lectures_path
  end



  private

  def lecture_params
    params.require(:lecture).permit(:lecture_name, :row, :col)
  end

  def seat_params
    params.require(:seat).permit(seat:[:lecture_id])
  end

end
