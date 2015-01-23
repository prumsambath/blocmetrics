require 'rails_helper'

RSpec.describe API::V1::EventsController, :type => :controller do
  describe "#create" do
    context 'registered website' do
      it "saves an event to the database" do
        website = create(:website, verified: true)
        request.env['HTTP_ORIGIN'] = website.address

        post :create, event: attributes_for(:event, website: website)
        expect(response.status).to eq(201)
      end

      it "does not save an event to the database unless the website is verified" do
        website = create(:website, verified: false)
        request.env['HTTP_ORIGIN'] = website.address

        expect {
          post :create, event: attributes_for(:event, website: website)
        }.to raise_error(ActionController::RoutingError)
      end

      xit "should not create an event for a verified website owned by another user" do
      end
    end

    context 'unregistered website' do
      it "does not save an event to the atabase" do
        request.env['HTTP_ORIGIN'] = 'http://not-registered.com'

        expect {
          post :create, event: attributes_for(:event)
        }.to raise_error(ActionController::RoutingError)
      end
    end
  end
end
