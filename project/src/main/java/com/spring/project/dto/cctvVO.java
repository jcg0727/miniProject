package com.spring.project.dto;

public class cctvVO {
	private int id;
	private String geom;
	private String new_addr;
	private String purpose;
	private String direction;
	private Double latitude;
	private Double longithude;
	private String point;
	
	
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGeom() {
		return geom;
	}
	public void setGeom(String geom) {
		this.geom = geom;
	}
	public String getNew_addr() {
		return new_addr;
	}
	public void setNew_addr(String new_addr) {
		this.new_addr = new_addr;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getLongithude() {
		return longithude;
	}
	public void setLongithude(Double longithude) {
		this.longithude = longithude;
	}
	
	
}
