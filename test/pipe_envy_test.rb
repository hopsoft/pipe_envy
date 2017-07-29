require "open-uri"
require "nokogiri"
require "coveralls"
Coveralls.wear!
SimpleCov.command_name "pry-test"

require_relative "../lib/pipe_envy"
using PipeEnvy

class PipeEnvyTest < PryTest::Test
  test "simple readme example" do
    assert "Ruby Rocks" | :upcase | :split == ["RUBY", "ROCKS"]
  end

  test "chained pipes" do
    output = "example" \
      | :chars \
      | :last \
      | :upcase
    assert output == "E"
  end

  test "pipes with block" do
    output = [1, 2, 3, 4, 5, 6, 7, 8, 9] \
      | [:select!, -> (i) { i.even? }]
    assert output == [2, 4, 6, 8]
  end

  test "complex pipeline" do
    output = (1..100) \
      | :to_a \
      | [:select!, -> (i) { i.even? }] \
      | [:map, -> (i) { i ** 10 }] \
      | :sum \
      | Math.method(:sqrt) \
      | :to_s \
      | :chars \
      | :reverse \
      | [:[], 3] \
      | :to_i

    assert output == 7
  end

  # TODO: record http result so we don't request on each run
  test "chainable methods repo example" do
    output = "foo bar http://github.com/hopsoft/pipe_envy foo bar" \
      | URI.method(:extract) \
      | :first \
      | URI.method(:parse) \
      | :open \
      | :readlines \
      | :join \
      | Nokogiri::HTML.method(:parse) \
      | [:css, "h1"] \
      | :first \
      | :text \
      | :strip
    assert output == "hopsoft/pipe_envy"
  end
end
