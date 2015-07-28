# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features)

## Uncomment to clear the screen before every task
# clearing :on

## Guard internally checks for changes in the Guardfile and exits.
## If you want Guard to automatically start up again, run guard in a
## shell loop, e.g.:
##
##  $ while bundle exec guard; do echo "Restarting Guard..."; done
##
## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"

# guard :minitest, test_folders: './' do
#   # with Minitest::Unit
#   watch(%r{^(.*)/(.*)_test\.rb$})
#   watch(%r{^(.*)/(.*)\.rb$})     { |m| 
#     "#{m[1]}/#{m[2]}_test.rb" unless m[0].match /test/
#   }
# end

guard :shell do
  watch %r{^ruby/(.*)/(.*)\.rb$} do |m|
    unless m[0].match /test\.rb$/
      `bundle exec ruby -rminitest/pride ruby/#{m[1]}/#{m[2]}_test.rb` 
    end
  end
  watch %r{^ruby/(.*)/(.*)_test\.rb$} do |m|
    `bundle exec ruby -rminitest/pride #{m[0]}`
  end
end
