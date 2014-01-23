class RefreshController < ApplicationController
  def index
  	@number = params[:number]

  	#set_concurrent_player
  	set_refresh_rate
  end

  private

  def set_refresh_rate
  	set_wp_option 'refresh', @number
  end
end
