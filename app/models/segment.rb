class Segment < ActiveRecord::Base
  after_initialize :set_orig_segment
  belongs_to :plan
  has_many :days
    
  def get_name
    if self.name.nil?
      return @orig_segment.name
    else
      return self.name
    end
  end
  
  def get_description
    if self.name.nil?
      return @orig_segment.description
    else
      return self.description
    end
  end
  
  def get_thumbnail
    if self.name.nil?
      return @orig_segment.thumbnail
    else
      return self.thumbnail
    end
  end

  def get_days
    if self.days.nil?
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
