class Grade < ApplicationRecord
  belongs_to :user
  belongs_to :assignment

  validates :assignment_id, uniqueness: {
    scope: :user_id,
    message: "Student has already been graded"
  }

end