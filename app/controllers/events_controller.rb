class EventsController < ApplicationController
  include MyModule
  
  def create_event_a
    event = Event.new
    event.event_name = 'Event A'
    event.user_id = current_user.id
    event.save
    MyModule::IterableService.create_event(event, current_user)
    redirect_to root_path, notice: 'Event A created successfully!'
  end

  def create_event_b
    event = Event.new
    event.event_name = 'Event B'
    event.user_id = current_user.id
    event.save
    MyModule::IterableService.create_event(event, current_user)
    redirect_to root_path, notice: 'Event B created successfully!'
  end

  def send_email_for_b
    events = Event.where(event_name: 'Event B')
    template_id = ""
    events.each do |event|
      MyModule::IterableService.send_email_notification(event, template_id, current_user)
    end
    redirect_to root_path, notice: 'Event B Email sent successfully!'
  end
end
