class DropTableChangeAttendances < ActiveRecord::Migration[5.2]
  def change
    drop_table :postcomments
  end
end
