class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :block

  validates :block_id, uniqueness: {
    scope: :user_id,
    message: "Student attendance has already been counted"
  }
end
