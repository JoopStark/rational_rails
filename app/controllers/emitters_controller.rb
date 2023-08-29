class EmittersController < ApplicationController
  def index
    @emitters = Emitter.all
  end

  def show
    @emitter = Emitter.find(params[:id])
  end
  
  def edit
    @emitter = Emitter.find(params[:id])
  end

  def update
    emitter = Emitter.find(params[:id])
    emitter.update(emitter_params)
    
    redirect_to "/emitters"
  end
  
private

  def emitter_params
    params.permit(:appliance, :co2e_per_hour, :hours_per_day, :use)
  end
end