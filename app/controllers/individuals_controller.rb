class IndividualsController < ApplicationController
  def index
    @individuals = Individual.newest_on_top.all
  end

  def show
    @individual = Individual.find(params[:id])
  end
end