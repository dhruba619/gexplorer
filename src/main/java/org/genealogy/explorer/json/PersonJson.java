package org.genealogy.explorer.json;

import javax.persistence.Column;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonProperty;

public class PersonJson {
   

    private Integer key;
    
    @Column(name="name")
    private String name;
    
   
    @JsonProperty("m")
    @ManyToOne
    private Integer motherKey;
    
  
    @JsonProperty("f")
    @ManyToOne
    private Integer fatherKey;
    
   
    @JsonProperty("dob")
    private Integer dateOfBirth; 
    
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

    public Integer getMotherKey() {
        return motherKey;
    }

    public void setMotherKey(Integer motherKey) {
        this.motherKey = motherKey;
    }

    public Integer getFatherKey() {
        return fatherKey;
    }

    public void setFatherKey(Integer fatherKey) {
        this.fatherKey = fatherKey;
    }

    public Integer getDateOfBirth() {
        return dateOfBirth;
    }

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
