class Plan < ActiveRecord::Base
  after_initialize :set_orig_plan
  belongs_to :user
  has_many :segments, -> { order('order_in_plan') }
  
  def self.swap(plan_id, segment_id, new_segment_id)  
    new_segment = Segment.new
    old_segment = Segment.find(segment_id)
    new_segment.orig_segment_id = new_segment_id
    new_segment.order_in_plan = old_segment.order_in_plan
    new_segment.save
    plan = Plan.find(plan_id)
    plan.segments << new_segment
    plan.segments.destroy(segment_id)
  end
  
  def self.save_plan(plan_id, user_id)
    logger.info "------------- save_plan with plan_id = "+ plan_id.to_s+"------------------"
    old_plan = Plan.find(plan_id)
    new_plan = Plan.new
    new_plan.orig_plan_id = old_plan.orig_plan_id
    new_plan.user_id = user_id
    new_plan.save
    old_plan.segments.each do |segment| 
      new_segment = Segment.new
      new_segment.orig_segment_id = segment.orig_segment_id
      new_segment.order_in_plan = segment.order_in_plan
      new_segment.save
      new_plan.segments << new_segment
    end
  end
  
  def get_name
    if self.name.nil?
      return @orig_plan.name
    else
      return self.name
    end
  end
  
  def get_description
    if self.name.nil?
      return @orig_plan.description
    else
      return self.description
    end
  end
  
  def get_thumbnail
    if self.name.nil?
      return @orig_plan.thumbnail
    else
      return self.thumbnail
    end
  end

  def get_segments
    if self.segments.nil?
      return @orig_plan.segments
    else
      return self.segments
    end
  end

private
  def set_orig_plan
    if self.orig_plan_id
      @orig_plan = Plan.find(self.orig_plan_id)
    end
  end
  
end
