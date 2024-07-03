package com.example.Assignment02.entity;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

@Entity
@Table(name = "`USER`")
@Data
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Column(name = "ID")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "ADDRESS")
    private String address;

    @Column(name = "`DESCRIPTION`")
    private String description;

    @Column(name = "EMAIL", nullable = false, unique = true)
    private String email;

    @Column(name = "FULL_NAME", nullable = false)
    private String fullName;

    @Column(name = "IMAGE")
    private String image;

    @Column(name = "`PASSWORD`")
    private String passWord;

    @Column(name = "PHONE_NUMBER")
    private String phoneNumber;

    @Column(name = "`STATUS`")
    private int status;

    @ManyToOne
    @JoinColumn(name = "ROLE_ID")
    private Role role;

    @ManyToOne
    @JoinColumn(name = "CV_ID")
    private Cv cv;

    @OneToMany(mappedBy = "user")
    private List<ApplyPosts> applyPosts;

    @PrePersist
    private void onPrePersist() {
        if (getRole().getId() == 2){
            setStatus(1);
        }else {
            setStatus(0);

        }
    }

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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Cv getCv() {
		return cv;
	}

	public void setCv(Cv cv) {
		this.cv = cv;
	}

	public List<ApplyPosts> getApplyPosts() {
		return applyPosts;
	}

	public void setApplyPosts(List<ApplyPosts> applyPosts) {
		this.applyPosts = applyPosts;
	}

    

}
