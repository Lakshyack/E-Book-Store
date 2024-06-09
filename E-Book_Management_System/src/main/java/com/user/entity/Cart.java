package com.user.entity;

public class Cart {
	private int cid;       // Cart item ID
	private int bid;       // Book ID
	private int userId;    // User ID
	private String bookName;  // Name of the book
	private String author;    // Author of the book
	private Double price;     // Price of the book
	private Double totalPrice; // Total price of the book (or cart item)

	// Getter and setter for cid
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}

	// Getter and setter for bid
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}

	// Getter and setter for userId
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

	// Getter and setter for bookName
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	// Getter and setter for author
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}

	// Getter and setter for price
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}

	// Getter and setter for totalPrice
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
}
