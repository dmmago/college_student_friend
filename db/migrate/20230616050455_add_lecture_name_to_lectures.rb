class AddLectureNameToLectures < ActiveRecord::Migration[6.1]
  def change
    add_column :lectures, :lecture_name, :string
  end
end
