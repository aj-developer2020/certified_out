class Block < ApplicationRecord
  belongs_to :cohort
  # belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :attendants, through: :attendances, source: :user
end
