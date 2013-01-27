class VaccinesController < ApplicationController
  before_filter :set_parent_and_child
  
  # GET /vaccines
  # GET /vaccines.json
  def index
    @vaccines = Vaccine.includes(:dosages)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vaccines }
    end
  end

  # GET /vaccines/1
  # GET /vaccines/1.json
  def show
    @vaccine = Vaccine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vaccine }
    end
  end

  # GET /vaccines/new
  # GET /vaccines/new.json
  def new
    @vaccine = Vaccine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vaccine }
    end
  end

  # GET /vaccines/1/edit
  def edit
    @vaccine = Vaccine.find(params[:id])
  end

  # POST /vaccines
  # POST /vaccines.json
  def create
    @vaccine = Vaccine.new(params[:vaccine])

    respond_to do |format|
      if @vaccine.save
        format.html { redirect_to @vaccine, notice: 'Vaccine was successfully created.' }
        format.json { render json: @vaccine, status: :created, location: @vaccine }
      else
        format.html { render action: "new" }
        format.json { render json: @vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vaccines/1
  # PUT /vaccines/1.json
  def update
    @vaccine = Vaccine.find(params[:id])

    respond_to do |format|
      if @vaccine.update_attributes(params[:vaccine])
        format.html { redirect_to @vaccine, notice: 'Vaccine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vaccines/1
  # DELETE /vaccines/1.json
  def destroy
    @vaccine = Vaccine.find(params[:id])
    @vaccine.destroy

    respond_to do |format|
      format.html { redirect_to vaccines_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def set_parent_and_child
    @parent = User.find(params[:user_id]) if params[:user_id].present?
    @child = Child.includes([:dosages, :dosages => :vaccine]).find(params[:child_id]) if params[:child_id].present?
    @child_vaccines = @child.dosages.group_by(&:vaccine) if @child
  end
end
