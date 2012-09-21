class DashboardsController < ApplicationController
  before_filter :require_login
  layout'admin'
  
  def index

  end
  def show
    @audits = Audit.order( "created_at DESC").limit(50)
  end

end
