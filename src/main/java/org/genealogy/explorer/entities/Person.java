package org.genealogy.explorer.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * 
 * Entity class for the person entity
 *
 */
@Entity
@Table(name="Person")
public class Person {

    @Id
    @Column(name="id")
    private Integer key;
    
    @Column(name="name")
    private String name;
    
    @Column(name="motherId")
    @JsonProperty("m")
    private Integer motherKey;
    
    @Column(name="fatherId")
    @JsonProperty("f")
    private Integer fatherKey;
    
    @Column(name="dateOfBirth")
    @JsonProperty("dob")
    private Integer dateOfBirth; 
    
    @Column(name="gender")
    private String gender;
    
    public Integer getKey() {
        return key;
    }
    public void setKey(Integer key) {
        this.key = key;
    }
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    @JsonProperty("m")
    public Integer getMotherKey() {
        return motherKey;
    }
    
    @JsonProperty("m")
    public void setMotherKey(Integer motherKey) {
        this.motherKey = motherKey;
    }
    
    @JsonProperty("f")
    public Integer getFatherKey() {
        return fatherKey;
    }
  
    @JsonProperty("f")
    public void setFatherKey(Integer fatherKey) {
        this.fatherKey = fatherKey;
    }
    
    @JsonProperty("dob")
    public Integer getDateOfBirth() {
        return dateOfBirth;
    }
    
    @JsonProperty("dob")
    public void setDateOfBirth(Integer dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }
    
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    
}
