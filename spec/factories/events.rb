FactoryGirl.define do
  factory :event do
    name "event name"
    meta({ "page_view" => "Welcome page" })
  end
end
