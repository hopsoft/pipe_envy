[![Lines of Code](http://img.shields.io/badge/lines_of_code-30-brightgreen.svg?style=flat)](http://blog.codinghorror.com/the-best-code-is-no-code-at-all/)
[![Code Status](http://img.shields.io/codeclimate/github/hopsoft/pipe_envy.svg?style=flat)](https://codeclimate.com/github/hopsoft/pipe_envy)
[![Dependency Status](http://img.shields.io/gemnasium/hopsoft/pipe_envy.svg?style=flat)](https://gemnasium.com/hopsoft/pipe_envy)
[![Build Status](http://img.shields.io/travis/hopsoft/pipe_envy.svg?style=flat)](https://travis-ci.org/hopsoft/pipe_envy)
[![Coverage Status](https://img.shields.io/coveralls/hopsoft/pipe_envy.svg?style=flat)](https://coveralls.io/r/hopsoft/pipe_envy?branch=master)
[![Downloads](http://img.shields.io/gem/dt/pipe_envy.svg?style=flat)](http://rubygems.org/gems/pipe_envy)

# PipeEnvy

[![Sponsor](https://app.codesponsor.io/embed/QMSjMHrtPhvfmCnk5Hbikhhr/hopsoft/pipe_envy.svg)](https://app.codesponsor.io/link/QMSjMHrtPhvfmCnk5Hbikhhr/hopsoft/pipe_envy)

## WARNING

This lib is experimental & is probably not a good idea.

> PipeEnvy overrides the pipe operator on Array & Integer.


Elixir's pipe operator is very cool & supports intuitive reasoning about data transformations.

```elixir
"Elixir Rocks" |> String.upcase |> String.split # => ["ELIXIR", "ROCKS"]
```

Rubyists can now enjoy this same mental model of data transformation.

```sh
gem install pipe_envy
```

```ruby
require "pipe_envy"
using PipeEnvy # apply monkey patches using refinements

"Ruby Rocks" | :upcase | :split # => ["RUBY", "ROCKS"]
```

Here's a more sophisticated albeit contrived example.
*Notice that methods which require arguments are piped as Arrays.*

```ruby
  magic = (1..100) \
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

  # => 7
```
