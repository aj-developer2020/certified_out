class AddReferenceAssignments < ActiveRecord::Migration[6.0]
  def change
    add_reference :assignments, :user, null: true, foreign_key: true
  end
end
