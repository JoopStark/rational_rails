class IndividualsController < ApplicationController
  def index
    @individuals = Individual.newest_on_top.all
  end

  def new
  end

  def show
    @individual = Individual.find(params[:id])
  end

  def create
    individual = Individual.create(individual_params)

    redirect_to "/individuals/#{individual.id}"
  end

  def individual_params
    params.permit(:name, :age, :email_display, :improve)
  end

  def edit
    @individual = Individual.find(params[:id])
  end
end