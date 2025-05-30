# frozen_string_literal: true

require 'amazing_print'

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'u', 'up'
  Pry.commands.alias_command 'd', 'down'
end

AmazingPrint.pry!

def file(content)
  File.write("/home/ramonsantos/temp_#{Time.now.to_i}", content)
end