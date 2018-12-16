package org.genealogy.explorer.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
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
    
    @JsonProperty("m")
    @ManyToOne
    private Person mother;
    
    @JsonProperty("f")
    @ManyToOne
    private Person father;
    
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
    public Person getMotherKey() {
        return mother;
    }
    
    @JsonProperty("m")
    public void setMotherKey(Person motherKey) {
        this.mother = motherKey;
    }
    
    @JsonProperty("f")
    public Person getFatherKey() {
        return father;
    }
  
    @JsonProperty("f")
    public void setFatherKey(Person fatherKey) {
        this.father = fatherKey;
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
