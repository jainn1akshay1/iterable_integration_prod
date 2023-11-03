require 'rails_helper'


describe EventsController, type: :controller do
  before do
    @user = FactoryBot.create(:user)
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in @user
  end

  it "should create Event B" do
 		stub_request(:post, "https://api.iterable.com/api/docs/events/track").
         with(
           body: "{\"email\":\"#{@user.email}\",\"eventName\":\"Event B\",\"dataFields\":{}}",
           headers: {
       	  'Accept'=>'*/*',
       	  'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       	  'Api-Key'=>'hbjhvdjcusjvcjasv',
       	  'User-Agent'=>'Ruby'
           }).
         to_return(status: 200, body: "", headers: {})  	
    post :create_event_b
	response.status == 302
    expect(flash[:notice]).to eq("Event B created successfully!")
  end
end

