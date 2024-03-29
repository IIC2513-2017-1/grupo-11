class ProyectsController < ApplicationController
  include Permission
  include Exchange

  before_action :set_proyect, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only: [:new, :create, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    is_founder?(@proyect)
  end


  def search
    if params[:search].present?
      @proyects = Proyect.where(name: params[:search])
    else
      @proyects = Proyect.all
    end
  end


  # GET /proyects
  # GET /proyects.json
  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      @proyects = Proyect.where(founder: user).paginate(page: params[:page], per_page: 9)
    elsif params[:category_id]
      category = Category.find(params[:category_id])
      @proyects = Proyect.where(category: category).paginate(page: params[:page], per_page: 9)
    else
      @proyects = Proyect.all.paginate(page: params[:page], per_page: 9)
    end
  end

  # GET /proyects/1
  # GET /proyects/1.json
  def show
    @exchange_rates = get_latest
  end

  # GET /proyects/new
  def new
    @proyect = Proyect.new
  end

  # GET /proyects/1/edit
  def edit
  end

  # POST /proyects
  # POST /proyects.json
  def create
    @proyect = Proyect.new(proyect_params)
    @proyect.score = 0
    @proyect.actual_money = 0
    @proyect.initial_date = Date.today
    @proyect.founder = current_user

    respond_to do |format|
      if @proyect.save
        format.html { redirect_to @proyect, notice: 'Proyect was successfully created.' }
        format.json { render :show, status: :created, location: @proyect }
      else
        format.html { render :new }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyects/1
  # PATCH/PUT /proyects/1.json
  def update
    respond_to do |format|
      if @proyect.update(proyect_params)
        format.html { redirect_to @proyect, notice: 'Proyect was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyect }
      else
        puts @proyect.errors.full_messages
        format.html { render :edit }
        format.json { render json: @proyect.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_score
    puts "like received"
    @proyect.score += 1

  end

  # DELETE /proyects/1
  # DELETE /proyects/1.json
  def destroy
    @proyect.destroy
    respond_to do |format|
      format.html { redirect_to proyects_url, notice: 'Proyect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_proyect
    @proyect = Proyect.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def proyect_params
    params.require(:proyect).permit(:name, :description, :initial_date, :due_date, :actual_money, :goal_money, :score,
                                    :user_ids, :category_id, :founder, :avatar)
  end
end
