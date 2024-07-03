package com.example.Assignment02.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "demo", catalog = "abc")
@Data
public class Demo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String urlImg;

}
