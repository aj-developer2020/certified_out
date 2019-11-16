class User < ApplicationRecord
  has_many :registrations, dependent: :destroy
  has_many :registered_cohorts, through: :registrations, source: :cohort
  # has_many :blocks, dependent: :nullify
  has_many :attendances, dependent: :destroy
  has_many :attended_blocks, through: :attendances, source: :block

  has_secure_password
  
end
