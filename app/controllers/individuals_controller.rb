class IndividualsController < ApplicationController
  def index
    @individuals = Individual.all
  end

  def show
    @individual = Individual.find(params[:id])
  end
end