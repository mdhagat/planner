module PlansHelper
  
  # recommend a plan based on the user
  def recommend (user_id)
    # currently returns a hard-coded plan
    recommended_plan_id = 1
    
    session[:recommended_plan_id] = recommended_plan_id
    return Plan.find(recommended_plan_id)
  end
  
end
