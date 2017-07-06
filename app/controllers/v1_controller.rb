class V1Controller < ApplicationController
  # MAKE SURE TO DEFINE YOUR VIEW IN THREE PLACES
  # * HERE as a new ruby function
  # * IN /VIEWS/V1/VIEWNAME.HTML.HAML
  # * IN /config/routes 
  def home
    if params.has_key?(:screen)
      @screen = params[:screen]
    else
      # This is home screen
      @screen = '7419'
    end
  end
end
