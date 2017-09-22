module BaseSerializer
  def attributes(*args)
    super(*args).compact
  end
end
