require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'rack'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req 
    @res = res 
  end

  # Helper method to alias @already_built_response
  def already_built_response?
  end

  # Set the response status code and header
  def redirect_to(url)
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    raise 'Cannot render content twice' if @already_built_response == @res 
    @res['Body'] = content 
    @res['Content-Type'] = content_type 

    @already_built_response = @res 
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
  end

  # method exposing a `Session` object
  def session
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

