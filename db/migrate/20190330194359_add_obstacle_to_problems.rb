class AddObstacleToProblems < ActiveRecord::Migration[5.2]
  def change
    add_column :problems, :obstacle, :boolean
    add_column :problems, :url_feedback, :string 
    add_column :problems, :feedback, :boolean 
  end
end
