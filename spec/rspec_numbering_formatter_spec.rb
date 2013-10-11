require 'spec_helper'

describe RspecNumberingFormatter do
  it "should produce helpful output" do
    rspec_command = 'bundle exec rspec spec/sample-specs --format RspecNumberingFormatter -P "**/*_spec_sample.rb" 2>&1'
    output = `#{rspec_command}`
    output.gsub!(/Finished in \d+.\d+ seconds/, 'Finished in some seconds').gsub!(/\r/, "\n*").gsub!(/\e/, 'ESC')
    output.should == "4 examples

*ESC[K    0:00          1 first should be nil                                                                                    ./spec/sample-specs/first_spec_sample.rb:4
*ESC[K    0:00          2 first should be non-nil                                                                                ./spec/sample-specs/first_spec_sample.rb:8
*ESC[K         3 second sample should include a broken test
           ./spec/sample-specs/second_spec_sample.rb:4
     Failure/Error: (1 + 1).should == 3
       expected: 3
            got: 2 (using ==)

*ESC[K    0:00          4 second sample should be true                                                                           ./spec/sample-specs/second_spec_sample.rb:8
Failures:

  1) second sample should include a broken test
     Failure/Error: (1 + 1).should == 3
       expected: 3
            got: 2 (using ==)
     # ./spec/sample-specs/second_spec_sample.rb:5:in `block (2 levels) in <top (required)>'

Finished in some seconds
4 examples, 1 failure

Failed examples:

rspec ./spec/sample-specs/second_spec_sample.rb:4 # second sample should include a broken test
"
  end
end
