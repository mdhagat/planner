class Activity < ActiveRecord::Base
  belongs_to :day
  has_and_belongs_to_many :providers
end
