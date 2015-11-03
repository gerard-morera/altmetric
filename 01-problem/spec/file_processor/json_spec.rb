require 'file_processor/json'

describe FileProcessor::Json do
  let(:data)           { [{"name"=>"gerard"}] }
  let(:builder_class)  { double 'builder_class' }

  let(:object)         { {"name"=>"gerard"} }
  let(:new_model)      { double 'new_model'}
  let(:model)          { double 'model'}

  subject { described_class.new data, builder_class }

  describe 'call' do
    before do
      allow(builder_class).to receive(:new).
        with(object).and_return(new_model)
      allow(new_model).to receive(:call).
        and_return(model)
    end

    it 'instanciates builder_class with arguments for every line' do
      expect(subject.call).to eq([model])
    end 
  end
end