require 'rails_helper'

describe 'vistor can click all of the links of the nav bar' do
  it 'can click on the browse link' do
    visit '/'

    click_on 'Tutorials'

    expect(current_path).to eq(tutorials_path)
  end

  it 'can click on the about link' do
    visit '/'

    click_on 'About'

    expect(current_path).to eq(about_path)
  end

  it 'can click on the getting started link' do
    visit '/'

    click_on 'Get Started'

    expect(current_path).to eq(get_started_path)
  end
end
