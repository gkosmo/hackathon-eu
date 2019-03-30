class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :problem, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
