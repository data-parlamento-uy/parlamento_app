class SessionsController < ApplicationController

  def index
    @date = Date.today
    @session = ParliamentSession.of_asamblea_general.where(date: @date).first
    @sessions = ParliamentSession.of_asamblea_general
    @selected_chamber = 'A'

  end

  def senadores
    @date = Date.today
    @session = ParliamentSession.of_senadores.where(date: @date).first
    @sessions = ParliamentSession.of_senadores
    @selected_chamber = 'S'

    render :index
  end

  def diputados
    @date = Date.today
    @session = ParliamentSession.of_diputados.where(date: @date).first
    @sessions = ParliamentSession.of_diputados
    @selected_chamber = 'D'

    render :index
  end

  def show
    @session = ParliamentSession.find(params[:id])
    @sessions = ParliamentSession.of_asamblea_general

    @date = @session.date
    @topic = params[:topic_id].present? ? @session.topics.find(params[:topic_id]) : @session.topics.first

    @selected_chamber = @session.chamber

    render :index
  end

end