class Assignment < ApplicationRecord
  belongs_to :cohort
  belongs_to :user
  has_many :grades, dependent: :destroy
  has_many :graders, through: :grades, source: :user

  validates(:title, presence: true)
  validates(:description, presence: true)


end
