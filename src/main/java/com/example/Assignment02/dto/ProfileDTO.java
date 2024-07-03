package com.example.Assignment02.dto;

import com.example.Assignment02.entity.Company;
import com.example.Assignment02.entity.User;
import lombok.Data;

@Data
public class ProfileDTO{
    private User user;
    private Company company;


    public ProfileDTO() {
    }

    public ProfileDTO(User user, Company company) {
        this.user = user;
        this.company = company;
    }

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}
    
    
}
