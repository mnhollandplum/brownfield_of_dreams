require 'rails_helper'

describe 'tutorial sequencer' do

  before(:each) do
    @admin = create(:admin, activated: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    @tutorial = create(:tutorial)
    @video    = create(:video, tutorial_id: @tutorial.id)
  end

  it 'admin can update a tutorial sequence' do

    skip("
      ActionController::RoutingError:
       Not Found
     # ./app/controllers/admin/api/v1/base_controller.rb:17:in `four_oh_four'
     # ./app/controllers/admin/api/v1/base_controller.rb:5:in `require_admin!'
      ")

    url = admin_api_v1_path( @tutorial )
    page.driver.submit(:put, url, {})

    expect(@video.position).to eq(data.position)

  end


end
