class NullUser

  def id
    SecureRandom.uuid
  end

  def first_name
    'Guest'
  end

  def last_name
    'Guest'
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def method_missing(*_args, &_block)
    self
  end
end
