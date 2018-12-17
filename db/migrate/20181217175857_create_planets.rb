class CreatePlanets < ActiveRecord::Migration[5.2]
  def change
    create_table :planets do |t|
      t.string :title
      t.text :description
      t.integer :distance

      t.timestamps
    end
  end
end
