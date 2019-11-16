class CreateBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :blocks do |t|
      t.date :date
      t.integer :duration
      t.string :type_of_block
      t.string :title

      t.timestamps
    end
  end
end
