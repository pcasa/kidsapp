class BowelMovementsController < ApplicationController
  # GET /bowel_movements
  # GET /bowel_movements.json
  before_filter :set_parent_child
  
  def index
    @bowel_movements = @child.bowel_movements

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bowel_movements }
    end
  end

  # GET /bowel_movements/1
  # GET /bowel_movements/1.json
  def show
    @bowel_movement = @child.bowel_movements.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bowel_movement }
    end
  end

  # GET /bowel_movements/new
  # GET /bowel_movements/new.json
  def new
    @bowel_movement = BowelMovement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bowel_movement }
    end
  end

  # GET /bowel_movements/1/edit
  def edit
    @bowel_movement = @child.bowel_movements.find(params[:id])
  end

  # POST /bowel_movements
  # POST /bowel_movements.json
  def create
    @bowel_movement = BowelMovement.new(params[:bowel_movement])

    respond_to do |format|
      if @bowel_movement.save
        format.html { redirect_to [@parent, @child, @bowel_movement], notice: 'Bowel movement was successfully created.' }
        format.json { render json: @bowel_movement, status: :created, location: @bowel_movement }
      else
        format.html { render action: "new" }
        format.json { render json: @bowel_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bowel_movements/1
  # PUT /bowel_movements/1.json
  def update
    @bowel_movement = @child.bowel_movements..find(params[:id])

    respond_to do |format|
      if @bowel_movement.update_attributes(params[:bowel_movement])
        format.html { redirect_to [@parent, @child, @bowel_movement], notice: 'Bowel movement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bowel_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bowel_movements/1
  # DELETE /bowel_movements/1.json
  def destroy
    @bowel_movement = @child.bowel_movements.find(params[:id])
    @bowel_movement.destroy

    respond_to do |format|
      format.html { redirect_to user_child_bowel_movements_url(@parent, @child) }
      format.json { head :no_content }
    end
  end
  
  private
  
  def set_parent_child
    @parent = User.find(params[:user_id]) if params[:user_id].present?
    @child = Child.find(params[:child_id]) if params[:child_id].present?
  end
end
