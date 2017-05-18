class ExcusesController < ApplicationController
  before_action :set_excuse, only: [:show, :update, :destroy]

  # GET /excuses
  def index
    @excuses = Excuse.all

    render json: @excuses
  end

  # GET /excuses/1
  def show
    render json: @excuse
  end

  # POST /excuses
  def create
    @excuse = Excuse.new(excuse_params)

    if @excuse.save
      render json: @excuse, status: :created, location: @excuse
    else
      render json: @excuse.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /excuses/1
  def update
    if @excuse.update(excuse_params)
      render json: @excuse
    else
      render json: @excuse.errors, status: :unprocessable_entity
    end
  end

  # DELETE /excuses/1
  def destroy
    @excuse.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_excuse
      @excuse = Excuse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def excuse_params
      params.require(:excuse).permit(:content, :count)
    end
end
