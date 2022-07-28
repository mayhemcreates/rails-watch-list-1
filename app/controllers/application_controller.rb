class ApplicationController < ActionController::Base
  before_action :list
private
  def list
    @list = List.first
  end
end
