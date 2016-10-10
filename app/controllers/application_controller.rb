class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :set_total_tokimon
  def set_total_tokimon
    @totalTokimons = Tokimon.all.length
  end
  
end
