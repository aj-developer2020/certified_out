class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :cohort

  validates :cohort_id, uniqueness: {
    scope: :user_id,
    message: "Has already been registered"
  }
end
