class CreateTokimons < ActiveRecord::Migration[5.0]
  def change
    create_table :tokimons do |t|
      t.integer :trainer_id
      t.string :name
      t.float :weight
      t.float :height
      t.integer :fly
      t.integer :fight
      t.integer :water
      t.integer :fire
      t.integer :electric
      t.integer :freeze
      t.integer :total

      t.timestamps
    end
  end
end
