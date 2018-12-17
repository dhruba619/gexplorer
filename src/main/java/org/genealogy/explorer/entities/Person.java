package org.genealogy.explorer.entities;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

/**
 * 
 * Entity class for the person entity
 *
 */
@Entity
@Table(name = "Person")
@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "key")
public class Person {

    @Id
    @Column(name = "id")
    private Integer key;

    @Column(name = "name")
    private String name;

    @JsonProperty("m")
    @ManyToOne
    private Person mother;

    @JsonProperty("f")
    @ManyToOne
    private Person father;

    @Column(name = "dateOfBirth")
    @JsonProperty("dob")
    private Integer dateOfBirth;

    @Column(name = "gender")
    private String gender;

    @OneToMany(mappedBy = "father", fetch = FetchType.EAGER)
    @JsonBackReference
    @JsonIgnore
    private Collection<Person> childrenf;

    @OneToMany(mappedBy = "mother", fetch = FetchType.EAGER)
    @JsonBackReference
    @JsonIgnore
    private Collection<Person> childrenm;

    public Collection<Person> getChildrenm() {
        return childrenm;
    }

    public void setChildrenm(Collection<Person> childrenm) {
        this.childrenm = childrenm;
    }

    public Collection<Person> getChildrenf() {
        return childrenf;
    }

    public void setChildrenf(Collection<Person> childrenf) {
        this.childrenf = childrenf;
    }

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
