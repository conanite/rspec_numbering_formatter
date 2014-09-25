require 'spec_helper'

describe RspecNumberingFormatter do
  it "should produce helpful output" do
    rspec_command = 'bundle exec rspec spec/sample-specs --format RspecNumberingFormatter -P "**/*_spec_sample.rb" 2>&1'
    putout = `#{rspec_command}`
    putout = putout.
      gsub(/Finished in \d+.\d+ seconds/, 'Finished in some seconds').
      gsub(/files took \d+.\d+ seconds to load/, 'files took AGES to load').
      gsub(/\r/, "\n*").
      gsub(/\e/, 'ESC').
      split(/\n/).
      map { |line| line.rstrip }.
      join("\n")
    expect(putout).to eq "4 examples

*ESC[K    0:00          1 first should be nil                                                                                    ./spec/sample-specs/first_spec_sample.rb:4
*ESC[K    0:00          2 first should be non-nil                                                                                ./spec/sample-specs/first_spec_sample.rb:8
*ESC[K         3 second sample should include a broken test
           ./spec/sample-specs/second_spec_sample.rb:4
Failure/Error: expect((1 + 1)).to eq 3

  expected: 3
       got: 2

  (compared using ==)
# ./spec/sample-specs/second_spec_sample.rb:5:in `block (2 levels) in <top (required)>'


*ESC[K    0:00          4 second sample should be true                                                                           ./spec/sample-specs/second_spec_sample.rb:8

Finished in some seconds (files took AGES to load)
4 examples, 1 failure

Failed examples:

rspec ./spec/sample-specs/second_spec_sample.rb:4 # second sample should include a broken test"
  end
end
