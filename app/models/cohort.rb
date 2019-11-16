class Cohort < ApplicationRecord

  has_many :blocks, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :registrants, through: :registrations, source: :user
  
  validates(:title, presence: true, uniqueness: true)


end
