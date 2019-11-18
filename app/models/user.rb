class User < ApplicationRecord
  before_validation :set_default_role

  has_many :registrations, dependent: :destroy
  has_many :registered_cohorts, through: :registrations, source: :cohort
  # has_many :blocks, dependent: :nullify
  has_many :attendances, dependent: :destroy
  has_many :attended_blocks, through: :attendances, source: :block
  
  has_secure_password

  validates :email, presence: true, uniqueness: true,format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, length: { minimum: 10 }
  validates :password_digest, presence: true

  def set_default_role
    self.role ||=0
  end
  
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: :true) do |row|
      User.create! row.to_hash
    end
  end
end
