class Segment < ActiveRecord::Base
  after_find :set_orig_segment
  belongs_to :plan
  has_many :days

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
    logger.info "----------- in get_days with orig_segment_id = " + self.orig_segment_id.to_s + "-------------"   
    if self.orig_segment_id
      return @orig_segment.days
    else
      return self.days
    end
  end

private
  def set_orig_segment
    logger.info "----------- in set_orig_segment with orig_segment_id = " + self.orig_segment_id.to_s + "-------------"    
    if self.orig_segment_id
      logger.info " ****** found orig_segment *******"
      @orig_segment = Segment.find(self.orig_segment_id)
    end
  end
  
end
