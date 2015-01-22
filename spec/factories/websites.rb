FactoryGirl.define do
  factory :website do
    name "My Website"
    address "http://example.com"
    description "Wesite description"

    factory :website_with_events do
      transient do
        events_count 2
      end

      after(:create) do |website, evaluator|
        create_list(:event, evaluator.events_count, website: website)
      end
    end
  end

  factory :invalid_website, class: :website do
    address ""
    name ""
  end
end
