class Assignment < ApplicationRecord
  belongs_to :cohort
  has_many :grades, dependent: :destroy
  has_many :graders, through: :grades, source: :user

  validates(:title, presence: true)
  validates(:description, presence: true)


end
