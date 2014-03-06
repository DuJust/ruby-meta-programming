class Proxy

  def initialize(subject)
    @subject = subject
    @called = {}
  end

  def method_missing(name, *args)
    eigenclass = class << self; self; end
    eigenclass.send(:define_method, name) do |*args|
      @called[name] ||= 0
      @called[name] += 1
      @subject.send(name, *args)
    end
    send(name, *args)
  end

  def messages
    @called.keys
  end

  def number_of_times_called(name)
    @called[name]
  end
end
