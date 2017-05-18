class OccasionsController < ApplicationController
  before_action :set_occasion, only: [:show, :update, :destroy]

  # GET /occasions
  def index
    @occasions = Occasion.all

    render json: @occasions
  end

  # GET /occasions/1
  def show
    render json: @occasion
  end

  # POST /occasions
  def create
    @occasion = Occasion.new(occasion_params)

    if @occasion.save
      render json: @occasion, status: :created, location: @occasion
    else
      render json: @occasion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /occasions/1
  def update
    if @occasion.update(occasion_params)
      render json: @occasion
    else
      render json: @occasion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /occasions/1
  def destroy
    @occasion.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occasion
      @occasion = Occasion.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def occasion_params
      params.require(:occasion).permit(:title)
    end
end
