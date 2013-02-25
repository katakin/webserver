require 'spec_helper'

describe Weather do
	before:all do
		Mongoid.load! '../../../mongoid.yml', 'webserver_test'
	end
  pending "add some examples to (or delete) #{__FILE__}"
end
