class SegmentsController < ApplicationController
  before_action :set_segment, only: [:show, :edit, :update, :destroy, :daybyday, :summary]
  before_action :signed_in_user, only: [:choose]

  # GET /segments
  # GET /segments.json
  def index
    @segments = Segment.all
  end

  # GET /segments/1
  # GET /segments/1.json
  def show
  end

  # GET /segments/new
  def new
    @segment = Segment.new
  end

  # GET /segments/1/edit
  def edit
  end

  # GET /daybyday
  def daybyday
    respond_to do |format|
      format.js {}
      format.json { }
    end
  end

  # GET /summary
  def summary
    respond_to do |format|
      format.js {}
      format.json { }
    end
  end
  
  # GET /choose
  def choose
  @segments = Segment.select{ |segment| segment.orig_segment_id.nil? }
    respond_to do |format|
      format.html # choose.html.erb
    end
  end

  # GET /swap
  def swap
    Plan.swap(params[:plan_id], params[:orig_segment_id], params[:new_segment_id])
    respond_to do |format|
      format.html { redirect_to plan_url(params[:plan_id]) }
    end
  end

  # POST /segments
  # POST /segments.json
  def create
    @segment = Segment.new(segment_params)

    respond_to do |format|
      if @segment.save
        format.html { redirect_to @segment, notice: 'Segment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @segment }
      else
        format.html { render action: 'new' }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /segments/1
  # PATCH/PUT /segments/1.json
  def update
    respond_to do |format|
      if @segment.update(segment_params)
        format.html { redirect_to @segment, notice: 'Segment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @segment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /segments/1
  # DELETE /segments/1.json
  def destroy
    @segment.destroy
    respond_to do |format|
      format.html { redirect_to segments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_segment
      @segment = Segment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def segment_params
      params.require(:segment).permit(:name, :description, :thumbnail, :plan_id)
    end
    
end
