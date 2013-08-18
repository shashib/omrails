class LocsController < ApplicationController

  before_filter :authenticate_user!,except: [:index]
  # GET /locs
  # GET /locs.json
  def index
    @locs = Loc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @locs }
    end
  end

  # GET /locs/1
  # GET /locs/1.json
  def show
    @loc = Loc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @loc }
    end
  end

  # GET /locs/new
  # GET /locs/new.json
  def new
    @loc = current_user.locs.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @loc }
    end
  end

  # GET /locs/1/edit
  def edit
    @loc = current_user.locs.find(params[:id])
  end

  # POST /locs
  # POST /locs.json
  def create
    @loc = current_user.locs.new(params[:loc])

    respond_to do |format|
      if @loc.save
        format.html { redirect_to @loc, notice: 'Loc was successfully created.' }
        format.json { render json: @loc, status: :created, location: @loc }
      else
        format.html { render action: "new" }
        format.json { render json: @loc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /locs/1
  # PUT /locs/1.json
  def update
    @loc = current_user.locs.find(params[:id])

    respond_to do |format|
      if @loc.update_attributes(params[:loc])
        format.html { redirect_to @loc, notice: 'Loc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @loc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locs/1
  # DELETE /locs/1.json
  def destroy
    @loc = current_user.locs.find(params[:id])
    @loc.destroy

    respond_to do |format|
      format.html { redirect_to locs_url }
      format.json { head :no_content }
    end
  end
end
