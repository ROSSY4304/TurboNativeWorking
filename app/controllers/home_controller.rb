class HomeController < ApplicationController
  def index
    @message = turbo_native_app? ? "Hello from Turbo Native!" : "Hello from Web!"
  end
  
  def test1
    @message = "This is Test Page 1"
    render :index
  end
  
  def test2
    @message = "This is Test Page 2"  
    render :index
  end
  
  private
  
  def turbo_native_app?
    request.user_agent.to_s.match(/Turbo Native/)
  end
end
