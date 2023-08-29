class IndividualEmittersController < ApplicationController
  def index
    @individual = Individual.find(params[:individual_id])
    @emitters = @individual.emitters
  end

  def new
    @individual = Individual.find(params[:individual_id])
  end

  def create
    @individual = Individual.find(params[:individual_id])
    @individual.emitters.create(emitter_params)

    # redirect_to "/individuals/#{individual.id}"
  end

  private
  
  def emitter_params
    params.permit(:appliance, :co2e_per_hour, :hours_per_day, :use)
  end
end