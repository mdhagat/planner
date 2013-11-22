class Segment < ActiveRecord::Base
  belongs_to :plan
  has_many :days
  
  def load_orig_segment
    if @orig_segment.nil?
      @orig_segment = Segment.find(self.orig_segment_id)
    end
  end
    
  def get_name
    load_orig_segment
    if self.name.nil?
      return @orig_segment.name
    else
      return self.name
    end
  end
  
  def get_description
    load_orig_segment
    if self.name.nil?
      return @orig_segment.description
    else
      return self.description
    end
  end
  
  def get_thumbnail
    load_orig_segment
    if self.name.nil?
      return @orig_segment.thumbnail
    else
      return self.thumbnail
    end
  end

  def get_days
    load_orig_segment
    return @orig_segment.days
  end
  
end
