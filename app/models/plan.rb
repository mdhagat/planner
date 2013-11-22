class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :segments
  
  def self.swap(plan_id, orig_segment_id, new_segment_id)  
    new_segment = Segment.new
    new_segment.orig_segment_id = new_segment_id
    new_segment.save
    plan = Plan.find(plan_id)
    plan.segments << new_segment
    plan.segments.destroy(orig_segment_id)
  end
  
end
