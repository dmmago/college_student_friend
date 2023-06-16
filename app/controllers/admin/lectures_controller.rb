class Admin::LecturesController < ApplicationController
  def new
    @lecture = Lecture.new
    @seat = Seat.new
  end

  def show
  end

  def index
  end
  
end
