class LegislatorsController < ApplicationController

  def index
    @legislators = Legislator.by_last_name
  end

  def diputados
    @legislators = Legislator.in_diputados.by_last_name
    render :index
  end

  def senadores
    @legislators = Legislator.in_senadores.by_last_name
    render :index
  end

  def search
    query = params[:query]
    @legislators = Legislator.search_by_name(query).by_last_name
  end

end