class DrVisitsController < ApplicationController
  # GET /dr_visits
  # GET /dr_visits.json
  before_filter :set_parent_child
  def index
    # @dr_visits = DrVisit.all
    @dr_visits = @child.dr_visits

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dr_visits }
    end
  end

  # GET /dr_visits/1
  # GET /dr_visits/1.json
  def show
    @dr_visit = DrVisit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dr_visit }
    end
  end

  # GET /dr_visits/new
  # GET /dr_visits/new.json
  def new
    @dr_visit = DrVisit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dr_visit }
    end
  end

  # GET /dr_visits/1/edit
  def edit
    @dr_visit = DrVisit.find(params[:id])
  end

  # POST /dr_visits
  # POST /dr_visits.json
  def create
    @dr_visit = DrVisit.new(params[:dr_visit])

    respond_to do |format|
      if @dr_visit.save
        if @child
          format.html { redirect_to [@parent, @child, @dr_visit], notice: 'Dr visit was successfully created.' }
        else
          format.html { redirect_to @dr_visit, notice: 'Dr visit was successfully created.' }
        end
        
        format.json { render json: @dr_visit, status: :created, location: @dr_visit }
      else
        format.html { render action: "new" }
        format.json { render json: @dr_visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dr_visits/1
  # PUT /dr_visits/1.json
  def update
    @dr_visit = DrVisit.find(params[:id])

    respond_to do |format|
      if @dr_visit.update_attributes(params[:dr_visit])
        if @child
          format.html { redirect_to [@parent, @child, @dr_visit], notice: 'Dr visit was successfully updated.' }
        else
          format.html { redirect_to @dr_visit, notice: 'Dr visit was successfully updated.' }
        end
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dr_visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dr_visits/1
  # DELETE /dr_visits/1.json
  def destroy
    @dr_visit = DrVisit.find(params[:id])
    @dr_visit.destroy

    respond_to do |format|
      format.html { redirect_to user_child_dr_visits_url(@parent, @child) }
      format.json { head :no_content }
    end
  end
  
  private
  
  def set_parent_child
    @parent = User.find(params[:user_id]) if params[:user_id].present?
    @child = Child.find(params[:child_id]) if params[:child_id].present?
  end
end
