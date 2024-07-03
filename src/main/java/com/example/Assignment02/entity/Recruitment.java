package com.example.Assignment02.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "RECRUITMENT")
@Data
public class Recruitment implements Serializable {

    private static final long serialVersionUID = 1L;

    @Column(name = "ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "ADDRESS", nullable = false)
    private String address;

    @Column(name = "CREATED_AT")
    private String createdAt;

    @Column(name = "`DESCRIPTION`")
    private String description;

    @Column(name = "EXPERIENCE")
    private String experience;

    @Column(name = "QUANTITY")
    private int quantity;

    @Column(name = "`RANK`")
    private String rank;

    @Column(name = "SALARY")
    private String salary;

    @Column(name = "`STATUS` ")
    private int status;

    @Column(name = "TITLE")
    private String title;

    @Column(name = "`TYPE`")
    private String type;

    @Column(name = "`VIEW`")
    private int view;

    @Column(name = "DEADLINE")
    private String deadline;

    @ManyToOne
    @JoinColumn(name = "CATEGORY_ID")
    private Category category;

    @ManyToOne
    @JoinColumn(name = "COMPANY_ID")
    private Company company;

    @OneToMany(mappedBy = "recruitment")
    private List<ApplyPosts> applyPosts;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public List<ApplyPosts> getApplyPosts() {
		return applyPosts;
	}

	public void setApplyPosts(List<ApplyPosts> applyPosts) {
		this.applyPosts = applyPosts;
	}

	

}
