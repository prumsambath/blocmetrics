require 'rails_helper'

describe 'Events API' do
  let(:event) { create(:event) }

  it 'sends a list of events' do
    create_list(:event, 10)

    get '/api/v1/events'

    expect(response).to be_success
    expect(json.length).to eq(10)
  end

  it 'retrieves a specific event' do
    get "/api/v1/events/#{event.id}"

    expect(json['name']).to eq(event.name)
  end

  it 'creates a new event' do
    expect {
      post '/api/v1/events', attributes_for(:event)
    }.to change(Event, :count).by(1)
  end

  xit 'updates an existing event' do
    new_event = attributes_for(:event, name: 'new event')
    patch "/api/v1/events/#{event.id}", id: event, event: new_event
    event.reload
    binding.pry
    expect(event.name).to eq('new event')
  end
end
