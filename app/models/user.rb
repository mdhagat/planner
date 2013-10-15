class User < ActiveRecord::Base
  has_one :profile
  has_one :preference
  has_many :plans
end
