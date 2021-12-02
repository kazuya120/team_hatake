class HomesController < ApplicationController
  layout  'theother_applidcation'

  def top
    render 'top', layout: nil
  end


end
