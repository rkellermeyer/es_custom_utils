require './spec_helper.rb'
require '../es.rb'

RSpec.describe ES do
  context 'methods' do
    subject { ES::ES.new }
    let(:indices) { %w(foo bar baz) }
    context "#client" do
      it 'responds to client' do
        expect(subject).to respond_to :client
      end
    end

    context "#collect_layers" do
      it 'responds to collect_layers' do
        expect(subject).to respond_to :collect_layers
      end

      it 'returns all layers' do
        # pending
      end
    end

    context "#map_indices" do
      it 'responds to map_indices' do
        expect(subject).to respond_to :map_indices
      end
    end

    context "#destroy_all_indices" do
      it 'responds to destroy_all_indices' do
        expect(subject).to respond_to :destroy_all_indices
      end
    end

    context "#build_indices" do
      it 'responds to build_indices' do
        expect(subject).to respond_to :build_indices
      end
    end
  end
end
