require "test_helper"

class JsonIpTest < ActiveSupport::TestCase
  setup do
    VCR.insert_cassette(name)
  end

  teardown do
    VCR.eject_cassette
  end
  test "returns an IP address" do
    assert_equal "105.163.1.23", JsonIp.ip
  end
end
