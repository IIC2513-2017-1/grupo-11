module Api::V1
  class ProyectsController < ApiController

    def index
      @proyects = Proyect.all
      render "api/v1/proyects/index.json.jbuilder"
    end

    def show
      @proyect = Proyect.find(params[:id])
      render "api/v1/proyects/show.json.jbuilder"
    end

    def create
      @proyect = Proyect.new(proyect_params)
      unless @proyect.save
        render json: { errors: @proyect.errors }, status: :unprocessable_entity
      end
      render "api/v1/proyects/create.json.jbuilder"
    end

    def proyect_params
      params.require(:proyect).permit(:name, :description, :initial_date, :due_date, :actual_money, :goal_money, :score,
                                      :user_ids, :category_id, :founder)
    end
  end
end
