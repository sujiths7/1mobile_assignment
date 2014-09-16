require "spec_helper"

describe Category do
  describe '#getCat' do
  	it 'get categories ' do
  	  expect(Category.new.getCat("http://www.1mobile.com")).not_to be_empty
  	end
  end

  describe '#get_c_link' do
  	it "get category links" do
        expect(Category.new.get_c_link("http://www.1mobile.com")).not_to be_empty
    end
  end

end
