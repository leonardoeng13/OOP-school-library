require 'json'
class Input
  def initialize(file_name)
    @file_name = file_name
  end

  def write(content)
    File.write(@file_name, JSON.dump(content))
  end
end
