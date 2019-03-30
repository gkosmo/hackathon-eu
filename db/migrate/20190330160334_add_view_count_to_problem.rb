class AddViewCountToProblem < ActiveRecord::Migration[5.2]
  def change
    add_column :problems, :view_count, :integer
  end
end
