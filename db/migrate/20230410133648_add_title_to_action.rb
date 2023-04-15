class AddTitleToAction < ActiveRecord::Migration[7.0]
  def change
    add_column :actions, :title, :string
  end
end
