# Polyglot Guardfile for Exercism

# In theory this could use Minitest directly for the Ruby exercises, but there
# were issues setting that up which I didn't feel like fixing.

guard :shell do
  # Ruby
  watch %r{^ruby/(.*)/(.*)\.rb$} do |m|
    unless m[0].match /test\.rb$/
      `bundle exec ruby -rminitest/pride ruby/#{m[1]}/#{m[2]}_test.rb`
    end
  end
  watch %r{^ruby/(.*)/(.*)_test\.rb$} do |m|
    `bundle exec ruby -rminitest/pride #{m[0]}`
  end

  # Javascript
  watch %r{^javascript/(.*)/(.*)\.js$} do |m|
    unless m[0].match /_test\.spec\.js$/
      puts "\n"
      `jasmine-node javascript/#{m[1]}/#{m[2]}_test.spec.js`
    end
  end
  watch %r{^javascript/(.*)/(.*)_test\.spec\.js$} do |m|
    puts "\n"
    `jasmine-node #{m[0]}`
  end

  # Clojure
  watch %r{^clojure/(.*)/src/(.*)\.clj$} do |m|
    `cd clojure/#{m[1]} && lein test`
  end

  # Erlang
  watch %r{^erlang/(.*)/(.*)\.erl$} do |m|
    unless m[2].match /test/
      `cd erlang/#{m[1]} && erl -make +debug_info && erl -noshell -eval "eunit:test(#{m[2]}, [verbose])" -s init stop && dialyzer #{m[2]}.erl`
    end
  end

  # Go
  watch %r{^go/(.*)/(.*)\.go$} do |m|
    unless m[2].match /test/
      `cd go/#{m[1]} && go test`
    end
  end

  # Python
  watch %r{^python/(.*)/(.*)\.py$} do |m|
    exercise = m[1].tr('-','_')
    `cd python/#{m[1]} && py.test #{exercise}_test.py`
  end

  # Scala
  watch %r{^scala/(.*)/(.*)\.scala$} do |m|
    exercise = m[1].tr('-','_')
    `cd scala/#{m[1]} && sbt test`
  end

  # Haskell
  watch %r{^haskell/(.*)/(.*)\.hs$} do |m|
    exercise = m[1].tr('-','_')
    `cd haskell/#{m[1]} && runhaskell -Wall #{exercise}_test.hs`
  end

  # OCaml
  watch %r{^ocaml/(.*)/(.*)\.mli?$} do |m|
    `cd ocaml/#{m[1]} && make`
  end

  # Crystal
  watch %r{^crystal/(.*)/(src|spec)/(.*)\.cr$} do |m|
    `cd crystal/#{m[1]} && crystal spec`
  end

  # Elixir
  watch %r{^elixir/(.*)/(.*)(_test)?.exs$} do |m|
    `cd elixir/#{m[1]} && elixir #{m[2]}_test.exs`
  end
end
