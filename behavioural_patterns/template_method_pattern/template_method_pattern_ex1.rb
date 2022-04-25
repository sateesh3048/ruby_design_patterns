class House
  def build_house
    build_foundation
    build_pillars
    build_roof
    build_walls
    build_windows
    puts 'Congratulations!!. Your house is ready to use!'
  end

  def build_foundation
    puts 'House foundation completed!'
  end

  def build_roof
    puts 'House Roof completed!'
  end

  def build_windows
    puts 'Building windows completed!'
  end
end

class WoodenHouse < House
  def build_walls
    puts 'Building wooden walls'
  end

  def build_pillars
    puts 'Building pillars with wooden coating!'
  end
end

class GlassHouse < House
  def build_walls
    puts 'Building glass walls'
  end

  def build_pillars
    puts 'Building pillars with glass coating!'
  end
end

puts '********** Building wooden house *************'
wooden_house = WoodenHouse.new
wooden_house.build_house

puts "\n\n Building glass house *****************"
glass_house = GlassHouse.new
glass_house.build_house
