require 'rails_helper'

RSpec.describe InstantNoodleGenerator do
  describe '#perform' do
    subject { described_class.perform(instant_noodle_time, hourglass1, hourglass2) }

    context 'when instant_noodle_time is 3, hourglass1 is 5 and hourglass2 is 7' do
      let(:instant_noodle_time) { 3 }
      let(:hourglass1) { 5 }
      let(:hourglass2) { 7 }

      it 'preparation_time is 10' do
        is_expected.to eq 10
      end
    end

    context 'when instant_noodle_time is 3, hourglass1 is 4 and hourglass2 is 5' do
      let(:instant_noodle_time) { 3 }
      let(:hourglass1) { 4 }
      let(:hourglass2) { 5 }

      it 'preparation_time is 8' do
        is_expected.to eq 8
      end
    end

    context 'when instant_noodle_time is 5, hourglass1 is 6 and hourglass2 is 5' do
      let(:instant_noodle_time) { 5 }
      let(:hourglass1) { 6 }
      let(:hourglass2) { 5 }

      it 'preparation_time is 5' do
        is_expected.to eq 5
      end
    end

    context 'when instant_noodle_time is 2, hourglass1 is 6 and hourglass2 is 7' do
      let(:instant_noodle_time) { 2 }
      let(:hourglass1) { 6 }
      let(:hourglass2) { 7 }

      it 'preparation_time is 14' do
        is_expected.to eq 14
      end
    end

    context 'when the hourglasses match up in the process' do
      let(:instant_noodle_time) { 3 }
      let(:hourglass1) { 6 }
      let(:hourglass2) { 8 }

      it 'returns message' do
        is_expected.to eq 'Não foi possível determinar o tempo de preparo do miojo pois as ampulhetas igualaram'
      end
    end

    context 'when an hourglass is less than instant_noodle_time' do
      let(:instant_noodle_time) { 3 }
      let(:hourglass1) { 2 }
      let(:hourglass2) { 1 }

      it 'returns message' do
        is_expected.to eq 'Ampulhetas devem ter o tempo maior ou igual ao do miojo'
      end
    end
  end
end