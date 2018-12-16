package org.genealogy.explorer.repositories;

import org.genealogy.explorer.entities.Person;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonRepository extends CrudRepository<Person, Integer>{

}
