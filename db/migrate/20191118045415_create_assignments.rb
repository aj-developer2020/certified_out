class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.text :attachment
      t.references :cohort, null: true, foreign_key: true

      t.timestamps
    end
  end
end
