package model;

import java.time.LocalDateTime;

public class User {
	protected int id;
	protected String username;
	protected String passwordHash;
	protected String email;
	protected String fullName;
	protected LocalDateTime createdAt;
	protected LocalDateTime updatedAt;

	public User() {
	}

	public User(String username, String passwordHash, String email, String fullName, LocalDateTime createdAt) {
		this.username = username;
		this.passwordHash = passwordHash;
		this.email = email;
		this.fullName = fullName;
		this.createdAt = createdAt;
	}

	public User(int id, String username, String passwordHash, String email, String fullName, LocalDateTime createdAt, LocalDateTime updatedAt) {
		this.id = id;
		this.username = username;
		this.passwordHash = passwordHash;
		this.email = email;
		this.fullName = fullName;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	// Getters and Setters

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPasswordHash() {
		return passwordHash;
	}
	public void setPasswordHash(String passwordHash) {
		this.passwordHash = passwordHash;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public LocalDateTime getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}
	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}
}
