# frozen_string_literal: true

require "test_helper"

class ReproTest < Minitest::Test
  def test_raises
    assert_raises do
      Repro.call
    end
  end
end
