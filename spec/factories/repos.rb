FactoryBot.define do
  factory :repo do
    sequence(:name) {|n| "Repo #{n}"}
    sequence(:html_url) {|n| "Repo #{n}"}
  end
end
