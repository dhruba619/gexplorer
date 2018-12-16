package org.genealogy.explorer.utils;

import java.util.Optional;

import org.genealogy.explorer.entities.Person;
import org.genealogy.explorer.json.BulkPersonRequest;
import org.genealogy.explorer.repositories.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PersonValidator {
    
    @Autowired
    PersonRepository personRepository;

    public void validate(Person person) throws GenealogyException {
        boolean isValid = true;

        if (person.getKey() == null) {
            isValid = false;
        }

        if (person.getName() == null || person.getName() == "") {
            isValid = false;
        }

        if (person.getFatherKey() != null) {
            Optional<Person> personOptional = personRepository.findById(person.getFatherKey());
            if(!personOptional.isPresent()) {
                throw new GenealogyException(AppConstants.ERROR_PERSON_DOES_NOT_EXIST , null); 
            }
        }

        if (person.getMotherKey() != null) {
            Optional<Person> personOptional = personRepository.findById(person.getMotherKey());
            if(!personOptional.isPresent()) {
                throw new GenealogyException(AppConstants.ERROR_PERSON_DOES_NOT_EXIST , null); 
            }
        }

        if (!isValid) {
            throw new GenealogyException(AppConstants.MISSING_REQUIRED_PARAM, null);
        }
    }

    public void validate(BulkPersonRequest persons) throws GenealogyException {
        for (Person person : persons.getList()) {
            validate(person);
        }
    }

}
