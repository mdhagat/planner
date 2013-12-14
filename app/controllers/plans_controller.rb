class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :store_location, only: [:show, :new]
  before_action :signed_in_user, only: [:customize, :new]

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end
  
  # GET /add_segment
  def add_segment
    respond_to do |format|
      format.html # index.html.erb
      format.js {}
      format.json { }
    end
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id

    logger.info "------------in CREATE ------------"
    params['segments'].each do |k, v|
      logger.info v
    end

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render action: 'show', status: :created, location: @plan }
      else
        format.html { render action: 'new' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url }
      format.json { head :no_content }
    end
  end
  
  # Save plan into my account
  def customize
      logger.info "--- in customize ----"
      redirect_back_or plans_path, 'Now please save the plan into your account'
  end
  
  
  # Save plan into my account
  def save_for_user
      logger.info "--- in save_for_user ----"
      Plan.save_plan(session[:recommended_plan_id], current_user.id)
      session.delete(:recommended_plan_id)
      redirect_to plans_path, :notice => "Plan saved in your account"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:name, :description, :thumbnail, :orig_plan_id, :user_id)
    end
end
