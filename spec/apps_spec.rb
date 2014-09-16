require "spec_helper"

describe Apps do
  describe '#getDesc' do
  	it 'get description of an app' do
  	  expect(Apps.new.getDesc("http://www.1mobile.com/go-weather-forecast-widgets-356672.html")).to be_kind_of(Array)
  	end
  end

  describe '#getPics' do
  	it 'get Screenshot of an app' do
  	  expect(Apps.new.getPics("http://www.1mobile.com/english-to-bangla-dictionary-616140.html")).not_to be_empty
  	end
  end
end
