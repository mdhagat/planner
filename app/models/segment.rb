class Segment < ActiveRecord::Base
  belongs_to :plan
  has_many :days
end
