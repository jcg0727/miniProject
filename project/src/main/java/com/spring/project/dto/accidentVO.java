package com.spring.project.dto;

import java.util.Date;

public class accidentVO {
	private int id;
	private String geom;
	private Date accident_date;
	private Double latitude;
	private Double longitud;
	private String bjd_code;
	private String bjd_name;
	private String point;
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
	public Date getAccident_date() {
		return accident_date;
	}
	public void setAccident_date(Date accident_date) {
		this.accident_date = accident_date;
	}
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	public Double getLongitud() {
		return longitud;
	}
	public void setLongitud(Double longitud) {
		this.longitud = longitud;
	}
	public String getBjd_code() {
		return bjd_code;
	}
	public void setBjd_code(String bjd_code) {
		this.bjd_code = bjd_code;
	}
	public String getBjd_name() {
		return bjd_name;
	}
	public void setBjd_name(String bjd_name) {
		this.bjd_name = bjd_name;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	
	
	
}
