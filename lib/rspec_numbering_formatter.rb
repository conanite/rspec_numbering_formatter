require 'rspec/core'
require 'rspec/core/formatters/base_text_formatter'

# useful reference: http://ascii-table.com/ansi-escape-sequences.php

class RspecNumberingFormatter < RSpec::Core::Formatters::BaseTextFormatter
  VERSION = "0.0.3"
  RSpec::Core::Formatters.register self, :start, :example_passed, :example_failed

  attr_accessor :run_count

  def failure_color(*args); red(*args); end unless method_defined? :failure_color

  def start(notification)
    super
    @cwd = `pwd`
    @start_time = Time.now
    @run_count = 0
    output.puts "#{notification.count} examples"
  end

  def example_passed(notification)
    elapsed = (Time.now - @start_time).to_i
    secs = elapsed % 60
    mins = elapsed / 60
    elapsed = "#{mins}:#{secs.to_s.rjust(2, '0')}"
    @run_count += 1
    output.print "\r\e[K#{elapsed.rjust(8)} #{@run_count.to_s.rjust(10)} #{notification.example.full_description[0..100].ljust(101)}  #{truncate_cwd(notification.example.location)[0..100]}"
  end

  def example_failed(notification)
    @run_count += 1
    output.puts "\r\e[K#{@run_count.to_s.rjust(10)} #{notification.example.full_description}"
    output.puts "           #{truncate_cwd notification.example.location}"
    output.puts notification.colorized_message_lines
    output.puts notification.colorized_formatted_backtrace
    output.puts
  end

  def truncate_cwd str
    str.sub @cwd, ""
  end

  def dump_failures notification
    puts
  end

end
