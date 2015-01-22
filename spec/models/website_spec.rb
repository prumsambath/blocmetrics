require 'rails_helper'

RSpec.describe Website, :type => :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }

  context 'with valid attributes' do
    let(:website) { create(:website) }

    it "creates a website" do
      expect(website).to be_valid
    end

    it "creates a non-verified website by default" do
      expect(website.verified).to be_falsey
    end

    it "generates a token by default" do
      expect(website.token).to_not be_nil
    end

    describe "#to_csv" do
      xit "exports all events to csv successfully" do
        website = create(:website_with_events)
      end
    end
  end

  context 'with invalid attributes' do
    it "does not create a website" do
      website = build(:invalid_website)
      expect(website).to_not be_valid
    end
  end
end
