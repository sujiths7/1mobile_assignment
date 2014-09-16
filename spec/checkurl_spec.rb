require "spec_helper"

describe CheckURL do
  describe '#isURL' do
  	it "validate given url" do
        expect(CheckURL.new.isURL("http://www.1mobile.com")).to eq(true)
        expect(CheckURL.new.isURL("1mobil.com")).to eq(false)
    end
  end
end
