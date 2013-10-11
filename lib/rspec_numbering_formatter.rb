require 'rspec/core/formatters/base_text_formatter'

# useful reference: http://ascii-table.com/ansi-escape-sequences.php

class RspecNumberingFormatter < RSpec::Core::Formatters::BaseTextFormatter
  VERSION = "0.0.2"

  attr_accessor :run_count

  def failure_color(*args); red(*args); end unless method_defined? :failure_color

  def start(example_count)
    @pwd = `pwd`
    @start_time = Time.now
    @run_count = 0
    super
    output.puts "#{example_count} examples"
  end

  def example_passed(example)
    super
    elapsed = (Time.now - @start_time).to_i
    secs = elapsed % 60
    mins = elapsed / 60
    elapsed = "#{mins}:#{secs.to_s.rjust(2, '0')}"
    @run_count += 1
    output.print "\r\e[K#{elapsed.rjust(8)} #{@run_count.to_s.rjust(10)} #{example.full_description[0..100].ljust(101)}  #{truncate_pwd(example.location)[0..100]}"
  end

  def example_failed(example)
    super
    @run_count += 1
    output.puts failure_color("\r\e[K#{@run_count.to_s.rjust(10)} #{example.full_description}")
    output.puts failure_color("           #{truncate_pwd example.location}")
    dump_failure_info example
  end

  def truncate_pwd str
    str.sub @pwd, ""
  end
end
