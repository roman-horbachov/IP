require 'minitest/autorun'
require_relative 'ipv4_validator'

class TestValidIPv4Address < Minitest::Test
  def test_valid_addresses
    assert_equal true, IPv4Validator.valid_ipv4_address?("192.168.1.1")
    assert_equal true, IPv4Validator.valid_ipv4_address?("8.8.8.8")
    assert_equal true, IPv4Validator.valid_ipv4_address?("0.0.0.0")
    assert_equal true, IPv4Validator.valid_ipv4_address?("255.255.255.255")
  end

  def test_invalid_addresses
    assert_equal false, IPv4Validator.valid_ipv4_address?("256.256.256.256")
    assert_equal false, IPv4Validator.valid_ipv4_address?("192.168.1")
    assert_equal false, IPv4Validator.valid_ipv4_address?("192.168.1.1.1")
    assert_equal false, IPv4Validator.valid_ipv4_address?("192.168.01.1")
    assert_equal false, IPv4Validator.valid_ipv4_address?("192.168.1.-1")
    assert_equal false, IPv4Validator.valid_ipv4_address?("192.168.1.a")
    assert_equal false, IPv4Validator.valid_ipv4_address?("192.168..1")
    assert_equal false, IPv4Validator.valid_ipv4_address?("192. 168.1.1")
    assert_equal false, IPv4Validator.valid_ipv4_address?(" 192.168.1.1 ")
    assert_equal false, IPv4Validator.valid_ipv4_address?("")
    assert_equal false, IPv4Validator.valid_ipv4_address?("abc.def.ghi.jkl")
    assert_equal false, IPv4Validator.valid_ipv4_address?("999.999.999.999")
  end
end
