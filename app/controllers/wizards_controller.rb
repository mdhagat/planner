class WizardsController < ApplicationController
  
  
  # GET /step_two
  def step_two

    respond_to do |format|
      format.html # index.html.erb
      format.js {}
      format.json { }
    end
  end
  
  # GET /step_three
  def step_three

    respond_to do |format|
      format.html # index.html.erb
      format.js {}
      format.json { }
    end
  end
  
end
