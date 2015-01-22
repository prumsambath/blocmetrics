require 'rails_helper'

RSpec.describe Event, :type => :model do
  it "should create a valid events with valid params" do
    event = create(:event)
    expect(event).to be_valid
  end

  it "should not create an event without a name" do
    event = build(:invalid_event)
    expect(event).to_not be_valid
  end
end
