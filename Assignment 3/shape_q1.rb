=begin
Amine Halimi 40112879
This is the code for class Shape and its subclasses Circle, Rectangle and Ellipse.
=end

#This is the class Shape
class Shape
    def initialize
    end

    #the print method is the same accross all classes. It calls for the functions perimeter and area
    def print
        name = self.class.name
        per = perimeter
        ar = area
        puts "#{name}, perimeter: #{per}, area: #{ar}"
    end

    def perimeter
        "undefined"
    end

    def area
        "undefined"
    end
end

#This is the class Circle
class Circle < Shape
    attr_accessor :radius
    def initialize(rad)
        @radius = rad
    end

    def perimeter
        return Math::PI * 2 * @radius
    end

    def area
        return Math::PI * @radius * @radius
    end
end
#This is the class Rectangle
class Rectangle < Shape
    attr_accessor :height, :width
    def initialize(hei, wid)
        @height = hei
        @width = wid
    end

    def perimeter
        return 2 * @height + 2 * @width
    end

    def area
        return @height * @width
    end
end

#This is the class Ellipse
class Ellipse < Shape
    attr_accessor :a, :b
    def initialize(maj, min)
        #This is to verify that the greater value is put in the major variable
        if (maj > min)
            @a = maj
            @b = min
        else
            @a = min
            @b = maj
        end
        
    end
    #perimeter stays undefined

    def area
        return @a * @b * Math::PI
    end

    def eccentricity
        root = Math.sqrt(@a * @a - @b * @b)
        return root
    end
end