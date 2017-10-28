package red.star;

public class Triangle {
	double sideA = 0,sideB = 0,sideC = 0,area = 0;
	boolean triangle = true;
	public double getSideA() {
		return sideA;
	}

	public void setSideA(double sideA) {
		this.sideA = sideA;
	}

	public double getSideB() {
		return sideB;
	}

	public void setSideB(double sideB) {
		this.sideB = sideB;
	}

	public double getSideC() {
		return sideC;
	}

	public void setSideC(double sideC) {
		this.sideC = sideC;
	}

	public double getArea() {
		double p = (sideA+sideB+sideC)/2.0;
		if(triangle)
			area = Math.sqrt(p * (p-sideA)*(p-sideB)*(p-sideC));
		return area;
	}

	public boolean isTriangle(){
		if(sideA<sideB+sideC&&sideB<sideA+sideC&&sideC<sideA+sideB)
			triangle = true;
		else
			triangle = false;
		return triangle;
	}
	
}
