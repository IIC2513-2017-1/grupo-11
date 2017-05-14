class CommentsController < ApplicationController
  include Permission


  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?, only: [:new, :create, :edit, :update, :destroy]
  before_action :load_project
  before_action only: [:update, :destroy, :edit] do
    is_mine?(@comment)
  end

  # GET /comments
  # GET /comments.json
  def index
    @comments = @proyect.comments.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @proyect.comments.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @proyect.comments.new(comment_params)
    @comment.comment_date = Date.today
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @proyect}
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@proyect, @comment]}
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @proyect}
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    load_project
    @comment = @proyect.comments.find(params[:id])
  end

  def load_project
    @proyect = Proyect.find(params[:proyect_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:comment_text, :proyect_id)
  end
end
