# RspecNumberingFormatter

An rspec formatter that shows elapsed time, example count, example description, and example location, with no scrolling except for errors.

Output looks something like this:

    $ rspec spec --format RspecNumberingFormatter
    5678 examples
       3:18   3999 A Widget when updated should not show widget status unless fa /spec/models/widgets/widget_update_spec.rb:42

This formatter uses ANSI escape sequences to overwrite and re-use the same line so you do
not get massive amounts of information scrolling past; you just see where you are in the
process, and how much time has elapsed so far.

A problem with the otherwise-excellent "progress" formatter arises when you have a large
number of examples taking a long time to run (like, anything more than sixty seconds). You
see a red "F" in the output, but you have to wait till the end of the process to see what
the problem is.

Another problem is that when you have zillions of examples, the "progress" formatter turns
your terminal into a sea of dots, and it's hard to know when your run will be finished. This
format prints the elapsed time along with the example count at the beginning of each line,
the better to help you judge how long you need to wait before hitting the magic DEPLOY button.

This formatter outputs failure information immediately so you can proceed with fixing instead
of twiddling your thumbs or browsing your favourite social site while your test suite hums
away in the background. This formatter means you can be more efficient while coding. Basically,
it makes you a better person. You should start using this formatter now.

Note: (seriously) if your main project has 6,000 rspec examples, like mine does, it's probably
pathological, and you should probably refactor, as I should. This formatter can help you cope
while you're waiting for the doctor.


## Installation

Add these lines to your application's Gemfile:

    group :test do
      gem 'rspec_numbering_formatter'
    end

And then execute:

    $ bundle


## Usage

Run rspec thus:

    $ bundle exec rspec spec --format RspecNumberingFormatter

Enjoy the immediate boost to your productivity.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
