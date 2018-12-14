require 'rails_helper'


# I'm not sure these features are used.
#   Edit was fundamentally broken - no view.
#   Create didn't even have a route or view


describe 'Videos' do

  before(:each) do
    @admin = create(:admin, activated: true)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    @tutorial1 = create(:tutorial)
    @tutorial2 = create(:tutorial)
    @video = create(:video, tutorial_id: @tutorial1.id)
  end


  it 'can edit a video' do
    visit edit_admin_video_path( @video )
    expect(page).to have_current_path( edit_admin_video_path( @video ) )
  end

  it 'can update only position' do
    # THESE WILL FAIL OCCASIONALLY because of faker!
    data = Video.create!(title:       "new",
                         description: "new",
                         video_id:    "new",
                         thumbnail:   "new",
                         tutorial_id:  @tutorial2.id,
                         position:     0
                      )

    # --- Able ---
    url = admin_video_path(@video, position: data.position)
    page.driver.submit(:patch, url, {})
    expect(@video.position).to eq(data.position)

    # --- Unable ---
    url = admin_video_path(@video, title: data.title)
    page.driver.submit(:patch, url, {})
    expect(@video.title).to_not eq(data.title)

    url = admin_video_path(@video, description: data.description)
    page.driver.submit(:patch, url, {})
    expect(@video.description).to_not eq(data.description)

    url = admin_video_path(@video, video_id: data.video_id)
    page.driver.submit(:patch, url, {})
    expect(@video.video_id).to_not eq(data.video_id)

    url = admin_video_path(@video, thumbnail: data.thumbnail)
    page.driver.submit(:patch, url, {})
    expect(@video.thumbnail).to_not eq(data.thumbnail)

    url = admin_video_path(@video, tutorial_id: data.tutorial_id)
    page.driver.submit(:patch, url, {})
    expect(@video.tutorial_id).to_not eq(data.tutorial_id)
  end



end
