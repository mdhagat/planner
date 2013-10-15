class Day < ActiveRecord::Base
  belongs_to :segment
  has_many :activities, :order => ‘start_time’
end
