class Block < ApplicationRecord
  before_validation :set_default_date
  before_validation :set_default_duration
  before_validation :set_default_type_of_block

  belongs_to :cohort
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :attendants, through: :attendances, source: :user

  validates(:title, presence: true)
  validates(:date, presence: true)
  validates(:type_of_block, presence: true)
  validates(:duration, presence: true)



  def set_default_date
    self.date ||=Date.today 
  end

  def set_default_duration
    self.duration ||= 2
  end
  def set_default_type_of_block
    self.type_of_block ||= "Lecture"
  end

end
