class EmittersController < ApplicationController
  def index
    @emitters = Emitter.all
  end

  def show
    @emitter = Emitter.find(params[:id])
  end
end