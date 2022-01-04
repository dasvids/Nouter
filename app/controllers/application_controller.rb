class ApplicationController < ActionController::Base
  def render_not_found
    render file: "#{Rails.root}/public/404.html", layout: true, status: :not_found
  end
end
