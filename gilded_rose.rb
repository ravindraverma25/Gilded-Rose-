class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
        when "Aged Brie"
          if (item.created_at + item.sell_in ) < (Time.now) && item.quality < 50
              item.quality += 1
          end
        when "Backstage passes to a TAFKAL80ETC concert"
          if (item.created_at + item.sell_in ) < (Time.now)
            item.quality = 0
          elsif ((item.created_at + item.sell_in ) - (Time.now)).to_i <= 10 &&  ((item.created_at + item.sell_in ) - (Time.now)).to_i > 5
            item.quality += 2
            item.quality = 50 if item.quality > 50
          elsif ((item.created_at + item.sell_in ) - (Time.now)).to_i <= 5
            item.quality += 3
            item.quality = 50 if item.quality > 50
          end
        when "Sulfuras, Hand of Ragnaros"
            item
        when "Conjured Mana Cake"
            item.quality -= 2
            item.quality = 0 if item.quality < 0
        else
          if (item.created_at + item.sell_in ) < (Time.now)
            item.quality -= 2
            item.quality = 0 if item.quality < 0
          end
        end
    end
  end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
