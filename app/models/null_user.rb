class NullUser
  def method_missing(method, *args)
    if respond_to? method
      nil
    else
      super
    end
  end

  def respond_to_missing?(*_args)
    true
  end
end
