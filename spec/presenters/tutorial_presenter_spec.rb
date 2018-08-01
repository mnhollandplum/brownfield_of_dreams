require 'rails_helper'
describe TutorialPresenter do
  describe 'instance methods' do
    it 'can find the current video' do
      tutorial = create(:tutorial)
      video1 = create(:video, tutorial_id: tutorial.id)
      video2 = create(:video, tutorial_id: tutorial.id)
      video3 = create(:video, tutorial_id: tutorial.id)

      presenter = TutorialPresenter.new(tutorial, video2.id)

      expect(presenter.current_video.id).to eq(video2.id)
    end

    it 'uses first video if video id not present' do
      tutorial = create(:tutorial)
      video1 = create(:video, tutorial_id: tutorial.id)
      video2 = create(:video, tutorial_id: tutorial.id)
      video3 = create(:video, tutorial_id: tutorial.id)

      presenter = TutorialPresenter.new(tutorial)

      expect(presenter.current_video.id).to eq(video1.id)
    end

    it 'can find the next video' do
      tutorial = create(:tutorial)
      video1 = create(:video, tutorial_id: tutorial.id, position: 1)
      video2 = create(:video, tutorial_id: tutorial.id, position: 2)
      video3 = create(:video, tutorial_id: tutorial.id, position: 3)

      presenter = TutorialPresenter.new(tutorial, video1.id)

      expect(presenter.next_video).to eq(video2.id)
    end
  end
end
