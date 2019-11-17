class RemoveIsArchivedFromCohorts < ActiveRecord::Migration[6.0]
  def change

    remove_column :cohorts, :is_archived, :boolean
  end
end
