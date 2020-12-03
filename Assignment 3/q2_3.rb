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
    def initialize(rad =0)
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
    def initialize(hei =0, wid =0)
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
    def initialize(maj =0, min=0)
        #This is to verify that the greater value is put in the major variable
        if (maj < 0 || min < 0)
            raise ArgumentError, 'Invalid Ellipse'
        end
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
        if (@a < 0 || @b < 0)
            raise ArgumentError, 'Invalid Ellipse'
            return 0
        else
        return @a * @b * Math::PI
        end
    end
    

    def eccentricity
        if (@a < 0 || @b < 0)
            raise ArgumentError, 'Invalid Ellipse'
        else
            root = Math.sqrt(@a * @a - @b * @b)
            return root
        end
    end
end


#instantiate counters for Q3
@numShapes = 0
@numRectangles = 0
@numCircles = 0
@numEllipses = 0

#Q2 read eachline from input.txt
puts"\n"
File.readlines('input.txt').each do |line|
    # for each line, split into array using space as delimiter
    element = line.split
    # creates new object instance where element is capitalized
    shape = Shape.const_get(element[0].capitalize).new
    
    # if the line (array) has more than one element 
    if element.length>1
        # since the head is the shape type, look at it to determine what to do 
        case element[0]
        
        # shape have undefined perimeter and area, only count
        when "shape"
        @numShapes+=1
        
        # rectange returns perimeter, area and count
        when "rectangle"
        shape.instance_variable_set(:@height, element[1].to_f)
        shape.instance_variable_set(:@width, element[2].to_f)
        @numShapes+=1
        @numRectangles+=1
        
        # circle returns perimeter, area nad count
        when "circle"
        shape.instance_variable_set(:@radius, element[1].to_f)
        @numShapes+=1
        @numCircles+=1
        
        # ellipse has condition for checking whether invalid,
        # has undefined perimeter, area and count
        when "ellipse"
        shape.instance_variable_set(:@a, element[1].to_f)
        shape.instance_variable_set(:@b, element[2].to_f)
        @numShapes+=1
        @numEllipses+=1
        end
    end
    # at the end print all the shape instances neatly

    shape.print
rescue ArgumentError => msg  
    # display the system generated error message  
    puts msg
end

# Q3 Statistics, keep count of the times instances were called in associative array
stats = { 
"Shape" => @numShapes,
"Rectange" => @numRectangles,
"Circle" => @numCircles,
"Ellipse" => @numEllipses
}

# print out statistics as string 
puts "\n"
puts "Statistics:"
stats.each_pair do |key, value|
    puts "   #{key}(s) : #{value}"
end