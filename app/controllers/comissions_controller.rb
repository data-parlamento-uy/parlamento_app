class ComissionsController < ApplicationController

  def index
    @comissions = Comission.of_asamblea_general
  end

  def senadores
    @comissions = Comission.of_senadores
    render :index
  end

  def diputados
    @comissions = Comission.of_diputados
    render :index
  end

end