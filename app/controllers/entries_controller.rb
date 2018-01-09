class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    list = List.find(params[:list_id])
    @entries = list.entries
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    list = List.find(params[:list_id])
    @entry = list.entries.find_by_id(params[:id])
  end

  # GET /entries/new
  def new
    list = List.find(params[:list_id])
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
    list = List.find(params[:list_id])
    @entry = list.entries.find(params[:id])
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = list.entries.build(params[:entry])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @list, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @list, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to list_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:name, :completed)
    end
end
