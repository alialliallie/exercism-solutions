module HelloWorld
  def self.hello(name)
    name.empty? ? "Hello, world!" : "Hello, #{name}!"
  end
end
