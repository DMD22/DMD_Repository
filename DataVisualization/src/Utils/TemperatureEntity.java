package Utils;


public class TemperatureEntity {
	private int id;
	private int position_id;
	private double x_point;
	private double y_point;
	private String date;
	private double value;
	public int getPosition_id() {
		return position_id;
	}
	public void setPosition_id(int position_id) {
		this.position_id = position_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getX_point() {
		return x_point;
	}
	public void setX_point(double x_point) {
		this.x_point = x_point;
	}
	public double getY_point() {
		return y_point;
	}
	public void setY_point(double y_point) {
		this.y_point = y_point;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	
}