package model;

import java.sql.Timestamp;


public class Ticket {
    private int num;
    private int userId;
    private String description;
    private String priority;
    private String status;
    private byte[] image;
    protected Timestamp createdAt;
	protected Timestamp updatedAt;

	public Ticket(int num, int userId, String description, String priority, String status, Timestamp createdAt,
			Timestamp updatedAt, byte[] image) {
		super();
		this.num = num;
		this.userId = userId;
		this.description = description;
		this.priority = priority;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.image = image;
	}

	public Ticket(int userId, String description, String priority, String status, Timestamp createdAt,
			Timestamp updatedAt, byte[] image) {
		super();
		this.userId = userId;
		this.description = description;
		this.priority = priority;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.image = image;
	}

	public Ticket(int num,int userId, String description, String priority, String status, Timestamp createdAt,
			Timestamp updatedAt) {
		this.num = num;
		this.userId = userId;
		this.description = description;
		this.priority = priority;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Timestamp getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}





}