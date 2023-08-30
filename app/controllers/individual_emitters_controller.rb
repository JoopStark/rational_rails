class IndividualEmittersController < ApplicationController
  def index
    @individual = Individual.find(params[:individual_id])
    if params[:co2e_per_hour] != nil 
      @emitters = @individual.emitters.co2e_over(params[:co2e_per_hour])
    else
      @emitters = @individual.emitters
    end
    
  end

  def new
    @individual = Individual.find(params[:individual_id])
  end

  def create
    @individual = Individual.find(params[:individual_id])
    @individual.emitters.create!(emitter_params)

    redirect_to "/individuals/#{@individual.id}/emitters"
  end

  private
  
  def emitter_params
    params.permit(:appliance, :co2e_per_hour, :hours_per_day, :use)
  end
end