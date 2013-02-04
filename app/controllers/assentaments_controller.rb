class AssentamentsController < ApplicationController
  
  respond_to :html, :json

  def new
    newNumass = Moviment.getNewNumass

    render :partial => 'assentaments/new',
           :locals => {:newNumAss => newNumass}

  end

  def create
    logger.debug params[:cttext].inspect

    params[:apunts].each { |apunt|
      logger.debug apunt.inspect
    }
  end

  def fillCtcteInput
    @input = Compte.autoCompleteCtcte(params[:numCompte])
    @compte = Compte.find_by_ctcte(@input)
   
    respond_with do |format|
      format.html do
        render :json => {:ctcte => @compte.ctcte, :ctdesc => @compte.ctdesc }
      end
    end
  end


end
