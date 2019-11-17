class Cohort < ApplicationRecord
  before_validation :set_default_status

  has_many :blocks, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :registrants, through: :registrations, source: :user
  
  validates(:title, presence: true, uniqueness: true)
  validates(:program, presence: true)
  validates(:status, presence: true)

# status to setup 
  def set_default_status
    self.status ||=2#Setup Phase
  end
end
