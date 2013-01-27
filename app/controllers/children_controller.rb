class ChildrenController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user
  # GET /children
  # GET /children.json
  def index
    @children = @user.children

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @children }
    end
  end

  # GET /children/1
  # GET /children/1.json
  def show
    @child = @user.children.find(params[:id])
    @shots = @child.pending_shots
    puts "-- dosages: #{@shots.inspect}"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @child }
    end
  end

  # GET /children/new
  # GET /children/new.json
  def new
    @child = Child.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @child }
    end
  end

  # GET /children/1/edit
  def edit
    @child = current_user.children.find(params[:id])
  end

  # POST /children
  # POST /children.json
  def create
    @child = Child.new(params[:child])
    @child.user_id = @user.id
    respond_to do |format|
      if @child.save
        format.html { redirect_to [@user, @child], notice: 'Child was successfully created.' }
        format.json { render json: @child, status: :created, location: @child }
      else
        format.html { render action: "new" }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /children/1
  # PUT /children/1.json
  def update
    @child = current_user.children.find(params[:id])

    respond_to do |format|
      if @child.update_attributes(params[:child])
        format.html { redirect_to [@user, @child], notice: 'Child was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /children/1
  # DELETE /children/1.json
  def destroy
    @child = current_user.children.find(params[:id])
    @child.destroy

    respond_to do |format|
      format.html { redirect_to user_children_url(@user) }
      format.json { head :no_content }
    end
  end
  
  def shots_recieving
    puts "-- What was received: #{params}"
    @child = current_user.children.find(params[:child_id])
    puts "-- shots: #{@child.shots}"
    puts "-- shots params: #{params[:shots]}"
    @child.update_attributes(params[:child])
  end
  
  private
  def set_user
    @user = current_user
  end
end
