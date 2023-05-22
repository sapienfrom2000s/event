class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
