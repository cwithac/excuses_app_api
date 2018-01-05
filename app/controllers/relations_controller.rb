class RelationsController < ApplicationController
  before_action :set_relation, only: [:show, :update, :destroy]
  before_action :authenticate_token, except: [:index, :show]
  before_action :authorize_delete_action, except: [:index,:show]

  # GET /relations
  def index
    @relations = Relation.all

    render json: @relations.to_json(include: [:occasion, :excuse])
  end

  # GET /relations/1
  def show
    # render json: @relation
    relation_hash = {
      occasion: Occasion.find(@relation.occasion_id).title,
      excuse: Excuse.find(@relation.excuse_id).content,
      count: Excuse.find(@relation.excuse_id).count
    }

    render json: relation_hash
  end

  # # POST /relations
  # def create
  #   @relation = Relation.new(relation_params)
  #
  #   if @relation.save
  #     render json: @relation, status: :created, location: @relation
  #   else
  #     render json: @relation.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # PATCH/PUT /relations/1
  # def update
  #   if @relation.update(relation_params)
  #     render json: @relation
  #   else
  #     render json: @relation.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /relations/1
  def destroy
    excuseFound = Excuse.find(@relation.excuse_id)
    @relation.destroy
    excuseFound.destroy
    render json: { status: 204 }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relation
      @relation = Relation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def relation_params
      params.require(:relation).permit(:occasion_id, :excuse_id)
    end
end
