class IndividualEmittersController < ApplicationController
  def index
    @individual = Individual.find(params[:individual_id])
    @emitters = @individual.emitters
  end
end