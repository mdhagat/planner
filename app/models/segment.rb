class Segment < ActiveRecord::Base
  after_find :set_orig_segment
  belongs_to :plan
  has_many :days, -> { order('order_in_segment') }

  def get_name
    if self.orig_segment_id
      return @orig_segment.name
    else
      return self.name
    end
  end
  
  def get_description
    if self.orig_segment_id
      return @orig_segment.description
    else
      return self.description
    end
  end
  
  def get_thumbnail
    if self.orig_segment_id
      return @orig_segment.thumbnail
    else
      return self.thumbnail
    end
  end

  def get_segment_type
    if self.orig_segment_id
      return @orig_segment.segment_type
    else
      return self.segment_type
    end
  end
  
  def is_air?
    self.get_segment_type == 'air'
  end

  def get_days
     if self.orig_segment_id
      return @orig_segment.days
    else
      return self.days
    end
  end

private
  def set_orig_segment
    if self.orig_segment_id
      @orig_segment = Segment.find(self.orig_segment_id)
    end
  end
  
end
