require 'test_helper'

class SassfmtTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Sassfmt::VERSION
  end

  def test_it_does_something_useful
    sass = <<SASS
body
  margin: 0 auto
  height: 100%
  $width: 960px
  width: $width
  z-index: 999

  display: none

  &.index
    background: steelblue
    width: 600px

  &.unknown
    a: b
    c: d
    e: f
    g: h
    i: j
    width: 100%
SASS

    expected = <<SASS
body
  height: 100%
  margin: 0 auto
  $width: 960px
  z-index: 999
  width: $width

  display: none

  &.index
    width: 600px
    background: steelblue

  &.unknown
    width: 100%
    a: b
    c: d
    e: f
    g: h
    i: j
SASS

    assert_equal expected, Sassfmt.format(sass)
  end
end
