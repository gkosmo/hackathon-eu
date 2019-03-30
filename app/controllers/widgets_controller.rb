  class WidgetsController < ApplicationController
    skip_before_action :authenticate_user!

    def show
      respond_to do |format|
        format.html { render :show, layout: 'widgets' }
        format.js   { render js: js_constructor }
      end
    end
  
    private
    def js_constructor
      content = render_to_string(:show, layout: false)
      "document.write(#{content.to_json})"
    end
  end
