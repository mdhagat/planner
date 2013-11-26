module PlansHelper
  
  # recommend a plan based on the user
  def recommend (user_id)
    # currently returns a hard-coded plan
    return Plan.find(11)
  end
  
end
