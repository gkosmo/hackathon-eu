class CreateProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :problems do |t|
      t.string :status
      t.references :category, foreign_key: true
      t.text :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
