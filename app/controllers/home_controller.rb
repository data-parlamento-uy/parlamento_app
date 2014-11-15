class HomeController < ApplicationController

  def index
    @sessions = ParliamentSession.all
  end

end