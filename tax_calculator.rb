class TaxCalculator

  def initialize( items )
    @items = items
  end

  def calculate_total_with_tax(country)
    total = 0

    @items.each do |item|
      total += item[:price] * item[:quantity]
    end

    if country == "EG"
      total += total * 0.14
    else
      total += total * 0.20
    end
    total
  end
end