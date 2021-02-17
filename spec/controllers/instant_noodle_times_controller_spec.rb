require 'rails_helper'

RSpec.describe InstantNoodleTimesController do
  describe 'GET#show' do
    let(:params) { { instant_noodle_time_id: 3, hourglass1_id: 5, id: 7 } }
    let(:result) { { 'preparation_time' => 10 } }

    before { get :show, params: params, format: :json }

    it 'return preparation_time as json' do
      json_response = JSON.parse(response.body)
      expect(json_response).to eq result
    end

    it 'returns a successful response' do
      expect(response).to be_successful
    end
  end
end