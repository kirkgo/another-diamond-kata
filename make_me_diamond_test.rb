require 'test/unit'
require_relative './make_me_diamond.rb'

class TestMakeMeDiamond < Test::Unit::TestCase
  def test_setup
    assert_equal(3, 2+1)
  end

  def test_stop_counter
    crafter = MakeMeDiamond.new('D')
    assert_equal(3, crafter.stop_counter)
  end

  def test_A_char
    crafter = MakeMeDiamond.new('A')
    diamond = crafter.make_diamond
    assert_equal(1, diamond.length)
    assert_equal('A', diamond[0])
  end

  def test_A_C_char
    crafter = MakeMeDiamond.new('C')
    b_line = crafter.line(1)
    assert_equal('-B-B-', b_line)
  end

  def test_A_B_char_left
    crafter = MakeMeDiamond.new('B')
    assert_equal('-A', crafter.left_output(0))
    assert_equal('B-', crafter.left_output(1))
  end

  def test_A_D_char
    crafter = MakeMeDiamond.new('D')
    diamond = crafter.make_diamond
    assert_equal(7, diamond.length)
    assert_equal('---A---', diamond[0])
    assert_equal('--B-B--', diamond[1])
    assert_equal('-C---C-', diamond[2])
    assert_equal('D-----D', diamond[3])
    assert_equal('-C---C-', diamond[4])
    assert_equal('--B-B--', diamond[5])
    assert_equal('---A---', diamond[6])
  end
end