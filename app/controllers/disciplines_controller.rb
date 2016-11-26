class DisciplinesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]
  before_filter :new, :only => [:new, :create]
  load_and_authorize_resource

  # GET /disciplines
  # GET /disciplines.json
  def index
    @disciplines = Discipline.all
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
     @degrees = @discipline.degreeprogram.distinct

    # @university = @discipline.university
    @sub = Subdiscipline.where(discipline_id:@discipline.id)
    # puts "asdas",@sub
  end

  # GET /disciplines/new
  def new
    @discipline = Discipline.new
  end

  # GET /disciplines/1/edit
  def edit
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    # puts "asdasdasdasdasda"
    # puts discipline_params
    
    @discipline = Discipline.new(discipline_params)
    # puts "hello"
    puts @discipline.save

    respond_to do |format|
      if @discipline.save
        # puts "here"
        format.html { redirect_to @discipline, notice: 'Discipline was successfully created.' }
        format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplines/1
  # PATCH/PUT /disciplines/1.json
  def update
    respond_to do |format|
      if @discipline.update(discipline_params)
        format.html { redirect_to @discipline, notice: 'Discipline was successfully updated.' }
        format.json { render :show, status: :ok, location: @discipline }
      else
        format.html { render :edit }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @discipline.destroy
    respond_to do |format|
      format.html { redirect_to disciplines_url, notice: 'Discipline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline
      @discipline = Discipline.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_params
      puts "asdasdasdasdasda"
      params.require(:discipline).permit(:Name, :Description)
    end
end
