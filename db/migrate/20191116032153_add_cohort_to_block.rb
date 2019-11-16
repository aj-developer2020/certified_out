class AddCohortToBlock < ActiveRecord::Migration[6.0]
  def change
    add_reference :blocks, :cohort, null: true, foreign_key: true
  end
end
