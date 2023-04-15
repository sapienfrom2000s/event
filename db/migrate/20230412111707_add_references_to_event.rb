class AddReferencesToEvent < ActiveRecord::Migration[7.0]
  def change
    add_reference :actions, :creator, foreign_key: { to_table: :users }
  end
end
