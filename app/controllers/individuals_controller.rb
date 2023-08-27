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
    individual = Individual.create(name: params[:name], 
                                    age: params[:age].to_i, 
                                    email_display: params[:email], 
                                    improve: params[:improve]=="1" )
                                    
    redirect_to "/individuals/#{individual.id}"
  end
end