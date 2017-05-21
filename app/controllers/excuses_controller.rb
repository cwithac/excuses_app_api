class ExcusesController < ApplicationController
  before_action :set_excuse, only: [:show, :update, :destroy]
  # before_action :authenticate_token, except: [:index]
  # before_action :authorize_user, except: [:index, :destroy]


  # GET /excuses
  def index
    @excuses = Excuse.all

    render json: {status: 200, excuses: @excuses}
  end

  # GET /excuses/1
  def show
    excuse = Excuse.find(params[:id])
    render json: {status: 200, excuse: @excuse}
  end

  # POST /excuses
  def create
    excusehash = {
      content: excuse_params[:content],
      count: excuse_params[:count],
      user_id: excuse_params[:user_id]
    }

    @excuse = Excuse.new(excusehash)

    if @excuse.save
      occasiontitle = Occasion.find_by(title: excuse_params[:occasion])

      relationtitle = Relation.create(occasion_id: occasiontitle.id, excuse_id: @excuse.id)

      render json: { status: 201, excuse: @excuse }
    else
      render json: { status: 422, excuse: @excuse }
    end

    # render json: excuse_params

  end

  # PATCH/PUT /excuses/1
  def update
    excuse = Excuse.find(params[:id])
    excuse.update(excuse_params)
    render json: { status: 200, excuse: excuse }
    # if @excuse.update(excuse_params)
    #   render json: @excuse
    # else
    #   render json: @excuse.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /excuses/1
  def destroy
    excuse = Excuse.destroy(params[:id])
    render json: { status: 204 }
    # @excuse.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_excuse
      @excuse = Excuse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def excuse_params
      params.require(:excuse).permit(:content, :count, :occasion, :user_id)
    end
end
