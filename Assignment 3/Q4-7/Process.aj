
public privileged aspect Process {
	//Q4 start here
	
	declare parents: Circle implements Shape;
	declare parents: Rectangle implements Shape;
	public String Circle.getName(){
		return "Circule";
	}
	public String Rectangle.getName(){
		return "Rectangle";
	}
	
	//Q5 start here
	public String Circle.toString(){
		return this.getName()+"("+this.radius;
	}
	
}
