module MyModule
  class IterableService
    include HTTParty
    base_uri ITERABLE_API_BASE_URL

    def self.create_event(event, current_user, data = {})
      response = post('/events/track', headers: { 'Api-Key' => ITERABLE_API_KEY }, body: {
        email: current_user.email,
        eventName: event.event_name,
        dataFields: data
      }.to_json)

      response.parsed_response
    end

    def self.send_email_notification(event, template_id, current_user, data = {})
      response = post('/email/target', headers: { 'Api-Key' => ITERABLE_API_KEY }, body: {
        email: current_user.email,
        templateId: template_id,
        dataFields: data
      }.to_json)

      response.parsed_response
    end
  end
end