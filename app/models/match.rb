class Match < ActiveRecord::Base
  belongs_to :enrolment
  validates :name, presence: true, length: { minimum: 3, maximum: 200 }
  validates :time, presence: true, uniqueness: true
  validates :rule, presence: true, length: { minimum: 20, maximum: 500 }

end
