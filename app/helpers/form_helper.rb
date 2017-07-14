module FormHelper

  def setup_event(event)
    event.statement ||= Statement.new
  end  

end