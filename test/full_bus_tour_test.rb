require_relative "../libs/exercise/solution/full_bus_tour_rec"
require "test/unit"
require "minitest/autorun"

class TestFullBusTour < Minitest::Test

  def test_simple_bus_full
    full_bus_tour = FullBusTour.new([3, 34, 4, 12, 5, 2], 9)
    assert(full_bus_tour.fits_exactly, "[3, 34, 4, 12, 5, 2] with a bus capacity of 9 should fit with [4, 5]")
  end

  def test_simple_bus_full_again
    full_bus_tour = FullBusTour.new([3, 34, 4, 12, 5, 2], 10)
    assert(full_bus_tour.fits_exactly, "[3, 34, 4, 12, 5, 2] with a bus capacity of 10 should fit with [3, 5, 2]")
  end

  def test_small_bus_non_full
    full_bus_tour = FullBusTour.new([3, 34, 4, 12, 5, 2], 1)
    assert(!full_bus_tour.fits_exactly, "{3, 34, 4, 12, 5, 2} with a bus capacity of 1 should not fit")
  end

  def test_ones_twos_bus_non_full
    full_bus_tour = FullBusTour.new([1, 2, 5, 8, 7, 12], 4)
    assert(!full_bus_tour.fits_exactly, "[1, 2, 5, 8, 7, 12] with a bus capacity of 4 should not fit")
  end

  def test_even_only_bus_non_full
    full_bus_tour = FullBusTour.new([2, 4, 2, 8, 6, 4, 10, 6], 21)
    assert(!full_bus_tour.fits_exactly, "[2, 4, 2, 8, 6, 4, 10, 6] with a bus capacity of 21 should not fit")
  end

  def test_odd_only_bus_full
    full_bus_tour = FullBusTour.new([1, 3, 5, 1, 7, 11, 9, 9], 21)
    assert(full_bus_tour.fits_exactly, "[1, 3, 5, 1, 7, 11, 9, 9] with a bus capacity of 21 should fit with [11, 9, 1]")
  end

  def test_big_bus_full
    full_bus_tour = FullBusTour.new([1, 3, 5, 4, 7, 11, 9, 9, 21, 7, 4, 21, 13, 8, 2, 5, 1, 18], 107)
    assert(full_bus_tour.fits_exactly, "[1, 3, 5, 4, 7, 11, 9, 9, 21, 7, 4, 21, 13, 8, 2, 5, 1, 18] with a bus capacity of 107 should fit")
  end

  def test_z_perf_test
    full_bus_tour = FullBusTour.new([1] * 500, 500)
    assert(full_bus_tour.fits_exactly, "Performance test is failing. Improve your algorithm!")
  end

end