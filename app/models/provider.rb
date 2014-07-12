class Provider < ActiveRecord::Base
  has_and_belongs_to_many :segments
end
