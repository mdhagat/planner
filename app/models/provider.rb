class Provider < ActiveRecord::Base
  has_and_belong_to_many :activities
end
