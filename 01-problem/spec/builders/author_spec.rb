require 'builders/author'

describe Builders::Author do
  let(:data)      { double 'data' }
  let(:validator) { double 'validator' }

  subject { described_class.new data }

  before do 
    allow(Validators::Author).to receive(:new).
      with(data).and_return(validator)
    allow(validator).to receive(:call).
      and_return(validator_response)
  end

  describe 'call' do
    context "when valid data" do
      let(:validator_response) { true }

      it 'instanciates the model' do
        expect(Models::Author).to receive(:new).
          with(data)

        subject.call
      end
    end

    context "when invalid data" do
      let(:validator_response) { false }
      
      it 'returns nil' do
        expect(subject.call).to eq nil
      end
    end
  end
end