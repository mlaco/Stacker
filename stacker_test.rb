require_relative "stacker_2"
require "test/unit"
require "redgreen"

class TestStacker2 < Test::Unit::TestCase
  def setup
    @s = Stacker2.new
    @s.s= [0.0, 1.0, 2.0, 3.0, 4.0, 5.0]
  end
  
  def teardown
  end
  
  def test_d_top
    assert_equal(1.0, @s.d_top(1))
    assert_equal(3.0, @s.d_top(2))
    assert_equal(6.0, @s.d_top(3))
    assert_equal(10.0, @s.d_top(4))
    assert_equal(15.0, @s.d_top(5))
  end
  
  def test_d_rel
    assert_raise(Exception){@s.d_rel(0,0)}
    assert_raise(Exception){@s.d_rel(1,1)}
    assert_raise(Exception){@s.d_rel(3,1)}
    
    assert_equal(1.0, @s.d_rel(0, 1))
    assert_equal(3.0, @s.d_rel(0, 2))
    assert_equal(6.0, @s.d_rel(0, 3))
    assert_equal(10.0, @s.d_rel(0, 4))
    assert_equal(15.0, @s.d_rel(0, 5))
    
    assert_equal(2.0, @s.d_rel(1, 2))
    assert_equal(5.0, @s.d_rel(1, 3))
    assert_equal(9.0, @s.d_rel(1, 4))
    
    assert_equal(9.0, @s.d_rel(3, 5))
  end
  
  def test_c_mass
    assert_equal(0.0, @s.c_mass(0))
    assert_equal(0.5, @s.c_mass(1))
    assert_equal(5.0/3, @s.c_mass(2))
    assert_equal(14.0/4, @s.c_mass(3))
    assert_equal(30.0/5, @s.c_mass(4))
    assert_equal(55.0/6, @s.c_mass(5))
  end
end
