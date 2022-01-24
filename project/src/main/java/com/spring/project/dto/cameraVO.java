package com.spring.project.dto;

public class cameraVO {
	
	private int id;
	private String geom;
	private String new_addr;
	private String old_addr;
	private Double latitude;
	private Double longitude;
	private String point;
	private int limit_speed;
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
	public String getOld_addr() {
		return old_addr;
	}
	public void setOld_addr(String old_addr) {
		this.old_addr = old_addr;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public int getLimit_speed() {
		return limit_speed;
	}
	public void setLimit_speed(int limit_speed) {
		this.limit_speed = limit_speed;
	}
	
	
}
