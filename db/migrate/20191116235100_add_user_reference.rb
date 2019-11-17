class AddUserReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :blocks, :user, null: true, foreign_key: true
    add_reference :cohorts, :user, null: true, foreign_key: true
  end
end
