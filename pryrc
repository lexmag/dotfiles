#!/usr/bin/env ruby
begin
  require "pry-doc"
  Pry.plugins["doc"].activate!
rescue LoadError
end

if File.exist?(rails = File.join(Dir.getwd, "config", "environment.rb"))
  require rails

  require "rails/console/app"
  require "rails/console/helpers"
  
  if Rails.version =~ /^3.2/
    extend Rails::ConsoleMethods
  end
  
  begin
    require "hirb"
  rescue LoadError
  end
  
  if defined? Hirb
    Hirb.enable

    Pry.config.print = proc do |output, value|
      Hirb::View.view_or_page_output(value) || Pry::DEFAULT_PRINT.call(output, value)
    end
  end
  
  def change_log(stream)
    ActiveRecord::Base.logger = Logger.new(stream)
    ActiveRecord::Base.clear_active_connections!
  end

  def show_log
    change_log(STDOUT)
  end

  def hide_log
    change_log(nil)
  end
end