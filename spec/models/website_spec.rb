require 'rails_helper'

RSpec.describe Website, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }

  it "should create a website if attributes' value are valid" do
    website = create(:website)
    expect(website).to be_valid
  end

  it "should not create a website if attributes's value are not valid" do
    website = build(:invalid_website)
    expect(website).to_not be_valid
  end

  it "should create a non-verified website by default" do
    website = create(:website)
    expect(website.verified).to be_falsey
  end

  it "should generate a token by default" do
    website = create(:website)
    expect(website.token).to_not be_nil
  end

  describe "#to_csv" do
    xit "should export all events to csv successfully" do
      website = create(:website_with_events)
    end
  end
end
