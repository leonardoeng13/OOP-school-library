require_relative 'required_files'

describe Corrector do
  before :each do
    @corrector = Corrector.new
  end

  describe '#corrected' do
    context 'when having more than 10 characters' do
      it 'should return a shortened name' do
        expect(@corrector.correct_name('intempériee')).to eq 'Intempérie'
      end
    end

    context 'with downcase first letter' do
      it 'should return a capitalized first letter' do
        expect(@corrector.correct_name('intempériee')).to eq 'Intempérie'
      end
    end
  end
end
