require "spec_helper"

describe Application do
  describe '#getApp' do
  	it 'get name of an app' do
  	  expect(Application.new.getApp("http://www.1mobile.com/apps/books_reference/")).to be_kind_of(Array)
  	end
  end

  describe '#get_l_links' do
  	it 'get link for an app' do
  	  expect(Application.new.get_l_links("http://www.1mobile.com","http://www.1mobile.com/apps/books_reference/")).not_to be_empty
  	end
  end

  describe '#get_d_links' do
  	it 'get download link for an app' do
  	  expect(Application.new.get_d_links("http://www.1mobile.com","http://www.1mobile.com/apps/books_reference/")).not_to be_empty
  	end
  end

end
