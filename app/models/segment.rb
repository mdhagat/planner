class Segment < ActiveRecord::Base
  belongs_to :plan
  has_many :days, -> { order('order_in_segment') }
  has_and_belongs_to_many :providers

  def is_stay?
    self.segment_type == 'Stay'
  end

end
