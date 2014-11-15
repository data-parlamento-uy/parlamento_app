class ComissionsController < ApplicationController

  def index
    @comissions = Comission.of_asamblea_general.by_name
    @selected_chamber = 'A'
  end

  def senadores
    @comissions = Comission.of_senadores.by_name
    @selected_chamber = 'S'
    render :index
  end

  def diputados
    @comissions = Comission.of_diputados.by_name
    @selected_chamber = 'D'
    render :index
  end

  def show
    @comission = Comission.find(params[:id])
    @selected_chamber = @comission.chamber

    if @comission.chamber == Comission::CHAMBERS[:diputados]
      @comissions = Comission.of_diputados.by_name
    elsif@comission.chamber == Comission::CHAMBERS[:senadores]
      @comissions = Comission.of_senadores.by_name
    else
      @comissions = Comission.of_asamblea_general.by_name
    end
  end

end