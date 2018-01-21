module Company
  def company_name(name)
    self.company = name
  end

  def company_manufacturer
    self.company
  end

  protected
  attr_accessor :company
end