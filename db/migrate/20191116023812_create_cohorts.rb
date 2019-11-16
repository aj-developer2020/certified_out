class CreateCohorts < ActiveRecord::Migration[6.0]
  def change
    create_table :cohorts do |t|
      t.string :title
      t.text :slack
      t.text :description
      t.text :picture_url
      t.integer :status
      t.string :program
      t.boolean :is_archived
      t.date :start_date

      t.timestamps
    end
  end
end
