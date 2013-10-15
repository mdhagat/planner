class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :days, :order => ‘day’
end
