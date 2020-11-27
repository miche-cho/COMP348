
public privileged aspect Process {
	//Q4 parents and getName() start here
	
	declare parents: Circle implements Shape;
	declare parents: Rectangle implements Shape;
	public String Circle.getName(){
		return "Circule";
	}
	public String Rectangle.getName(){
		return "Rectangle";
	}
	
	//Q5 toString() start here
	public String Circle.toString(){
		return this.getName()+"("+this.radius+")";
	}
	public String Rectangle.toString(){
		return this.getName()+"("+this.width+","+this.height+")";
	}
	//Q6 Circle.getArea() start here, part of Q7 is also used here
	pointcut circleA (Circle c):
		execution(double Circle.getArea())&& this(c);
	double around (Circle c): circleA(c){
		if(c.radius<0)
			return 0;
		else return Math.PI*c.radius*c.radius;
	}
	//Q7 handling negative value start here
	pointcut circleP (Circle c):
		execution(double Circle.getPerimeter())&& this(c);
	double around (Circle c): circleP(c){
		if(c.radius<0)
			return 0;
		else return proceed(c);
	}
	//a pointcut for both area and perimeter
	pointcut rectangleB (Rectangle r):
		(execution(double Rectangle.getPerimeter())||
				execution(double Rectangle.getArea()))&&
		this(r);
	double around(Rectangle r): rectangleB(r){
		if (r.width<0||r.height<0)
			return 0;
		else return proceed(r);
	}
}
