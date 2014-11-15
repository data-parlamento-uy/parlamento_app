class ComissionsController < ApplicationController

  def index
    @comissions = Comission.of_asamblea_general.by_name
    filter_by_type

    @selected_chamber = 'A'
    @action = 'index'
  end

  def senadores
    @comissions = Comission.of_senadores.by_name
    filter_by_type

    @selected_chamber = 'S'
    @action = 'senadores'

    render :index
  end

  def diputados
    @comissions = Comission.of_diputados.by_name

    filter_by_type

    @selected_chamber = 'D'
    @action = 'diputados'

    render :index
  end

  def show
    @comission = Comission.find(params[:id])
    @selected_chamber = @comission.chamber

    if @comission.chamber == Comission::CHAMBERS[:diputados]
      @comissions = Comission.of_diputados.by_name
      @action = 'diputados'
    elsif@comission.chamber == Comission::CHAMBERS[:senadores]
      @comissions = Comission.of_senadores.by_name
      @action = 'senadores'
    else
      @comissions = Comission.of_asamblea_general.by_name
      @action = 'index'
    end

    filter_by_type
  end

  private

  def filter_by_type
    @comissions = @comissions.where(comission_type: params[:type]) if params[:type].present? && params[:type] != 'todas'
  end

end