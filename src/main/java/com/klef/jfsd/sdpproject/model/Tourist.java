package com.klef.jfsd.sdpproject.model;

import jakarta.persistence.*;

@Entity
@Table(name="tourist_table")
public class Tourist {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="tourist_id")
    private int id;

    @Column(name="tourist_name", nullable=false, length=50)
    private String name;

    @Column(name="tourist_gender", nullable=false, length=20)
    private String gender;

    @Column(name="tourist_dob", nullable=false, length=20)
    private String dateOfBirth;

    @Column(name="tourist_email", nullable=false, unique=true, length=50)
    private String email;

    @Column(name="tourist_password", nullable=false, length=50)
    private String password;

    @Column(name="tourist_contact", nullable=false, unique=true, length=20)
    private String contact;

    // Default constructor
    public Tourist() {}

    // Parameterized constructor
    public Tourist(String name, String gender, String dateOfBirth, String email, String password, String contact) {
        this.name = name;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.password = password;
        this.contact = contact;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(String dateOfBirth) { this.dateOfBirth = dateOfBirth; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }
}
