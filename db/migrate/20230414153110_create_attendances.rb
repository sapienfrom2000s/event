class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.timestamps
    end
    add_reference(:attendances, :attended, foreign_key: { to_table: :actions })
    add_reference(:attendances, :attendee, foreign_key: { to_table: :users })
  end
end
