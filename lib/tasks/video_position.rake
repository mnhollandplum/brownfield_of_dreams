namespace :video_position do
  desc "Updates nil video positions to 0"

  task :set_default_position => :environment do
    Video.where(position: nil).each do |t|
      t.update_attribute :position, '0'
    end
  end
end
