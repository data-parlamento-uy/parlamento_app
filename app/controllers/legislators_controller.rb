class LegislatorsController < ApplicationController

  def index
    @legislators = Legislator.all
  end

  def diputados
    @legislators = Legislator.in_diputados
    render :index
  end

  def senadores
    @legislators = Legislator.in_senadores
    render :index
  end

  def search
    query = params[:query]
    @legislators = Legislator.search_by_name(query)
  end

end