require_relative './file'
require_relative './input'
require_relative './output'

class InputOutput
  def initialize(name)
    @file_name = name
    CreateFile.new(name)
    @input = Input.new(name)
    @output = Output.new(name)
    @hash = @output.read || []
  end

  def write(content)
    @hash << content
    @input.write(@hash)
  end

  def read
    @hash
  end
end
