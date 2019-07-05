require_relative '../lib/appoptics-services/numbers'

class NumbersTest < Test::Unit::TestCase
  Numbers = AppOptics::Services::Numbers

  def format(threshold, number, tolerance=2)
    AppOptics::Services::Numbers.format_for_threshold(threshold,number,tolerance)
  end

  def test_does_not_change
    assert format(10, 10.53) == 10.53
    assert format(10.53, 10.53) == 10.53
  end

  def test_changes
    assert_equal 10.5312, format(10.53, 10.5312345)
    assert_equal 10.53, format(10, 10.5312345)
    assert_equal 0.53, format(0, 0.5312345)
    assert_equal 0.5312, format(0.12, 0.5312345)
    assert_equal 100, format(10, 100)
  end


end
