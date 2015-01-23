FactoryGirl.define do
  factory :event do
    name "event name"
    meta({ "page_view" => "Welcome page" })

    factory :invalid_event do
      name ""
    end
  end
end
