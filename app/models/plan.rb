class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :segments, -> { order('order_in_plan') }
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage/
                                
  # Default thumbnail images for plan and segments
  DEFAULT_PLAN_IMAGE = "travel3.gif"
  DEFAULT_SEGMENT_IMAGE = "travel4.gif"
  DEFAULT_STAY_IMAGE = "travel4.gif"
  DEFAULT_TRANSPORT_IMAGE = "flight.gif"
  
  #
  # Swap a segment in a plan with a different one
  #
  def self.swap(plan_id, segment_id, new_segment_id)
    # find original record of the segment and make a copy  
    new_segment = Segment.new
    old_segment = Segment.find(segment_id)
    new_segment.orig_segment_id = new_segment_id
    new_segment.order_in_plan = old_segment.order_in_plan
    new_segment.save
    plan = Plan.find(plan_id)
    # insert new segment and remove the old one
    plan.segments << new_segment
    plan.segments.destroy(segment_id)
  end
  
  #
  # Copy plan into into user's account
  #
  def self.save_plan(plan_id, user_id)
    old_plan = Plan.find(plan_id)
    orig_plan = Plan.find(old_plan.orig_plan_id)
    new_plan = orig_plan.dup
#    new_plan = Plan.new
#    new_plan.orig_plan_id = old_plan.orig_plan_id
    new_plan.user_id = user_id
    new_plan.save
    # iterate over segments to duplicate them
    old_plan.segments.each do |segment| 
      orig_segment = Segment.find(segment.orig_segment_id)
      new_segment = orig_segment.dup
#      new_segment = Segment.new
#      new_segment.orig_segment_id = segment.orig_segment_id
#      new_segment.order_in_plan = segment.order_in_plan
      new_segment.save
      new_plan.segments << new_segment
    end
  end

  #
  # Add segment data
  #
  def add_segments(segments)
 
    if segments
      segment_order = 1
      
      # iterate over segments list
      segments.each do |k, v|
        new_segment = Segment.new
        new_segment.order_in_plan = segment_order
        segment_order += 1
        logger.info "adding segment name: " + v["title"] + " adding description: " + v["description"]
        # set segment attributes
        new_segment.name = v["title"]
        new_segment.description = v["description"]
        new_segment.thumbnail = v["thumbnail"]
        new_segment.segment_type = v["segment_type"]
        new_segment.save
        
        # process days list if any
        if v["days"]
          day_order = 1
          days = v["days"]
          # iterate over the list of days
          days.each do |d_k, d_v|
            new_day = Day.new
            new_day.order_in_segment = day_order
            day_order += 1
            logger.info " --  adding day name: " + d_v
            # set day attributes
            new_day.name = d_v
            new_day.save
            new_segment.days << new_day
          end
        end
        
        # put segment into plan
        self.segments << new_segment
        
      end # segments.each
    end # if segments
  end # def

end
