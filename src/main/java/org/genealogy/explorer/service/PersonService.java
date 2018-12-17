package org.genealogy.explorer.service;

import java.util.List;
import java.util.Optional;

import org.genealogy.explorer.entities.Person;
import org.genealogy.explorer.json.PersonJson;
import org.genealogy.explorer.repositories.PersonRepository;
import org.genealogy.explorer.utils.AppConstants;
import org.genealogy.explorer.utils.GenealogyException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.FilterProvider;
import com.fasterxml.jackson.databind.ser.impl.SimpleBeanPropertyFilter;
import com.fasterxml.jackson.databind.ser.impl.SimpleFilterProvider;
import com.monitorjbl.json.JsonView;
import com.monitorjbl.json.JsonViewSerializer;

import static com.monitorjbl.json.Match.match;

@Service
public class PersonService {

    @Autowired
    private PersonRepository personRepository;

    public Person getPerson(int key) throws GenealogyException {
        Optional<Person> personOptional = personRepository.findById(key);
        if (personOptional.isPresent()) {
            return personOptional.get();
        } else {
            throw new GenealogyException(String.format(AppConstants.ERROR_PERSON_DOES_NOT_EXIST, String.valueOf(key)), null);
        }
    }

    public boolean createPerson(PersonJson json) throws GenealogyException {
        Person person = new Person();

        person.setDateOfBirth(json.getDateOfBirth());
        if (null != json.getFatherKey())
            person.setFatherKey(getPerson(json.getFatherKey()));
        if (null != json.getFatherKey())
            person.setMotherKey(getPerson(json.getMotherKey()));
        person.setGender(json.getGender());
        person.setKey(json.getKey());
        person.setName(json.getName());

        if (!personRepository.findById(person.getKey())
            .isPresent()) {
            personRepository.save(person);
            return true;
        } else {
            throw new GenealogyException(AppConstants.ERROR_PERSON_ALREADY_EXIST, null);
        }
    }

    public Iterable<Person> createPeople(List<Person> people) throws GenealogyException {
        try {
            return personRepository.saveAll(people);
        } catch (Exception e) {
            throw new GenealogyException(AppConstants.ERROR_PERSON_ALREADY_EXIST, null);
        }
    }

    public boolean updatePerson(int key, PersonJson json) throws GenealogyException {
        Optional<Person> personOptional = personRepository.findById(key);
        if (personOptional.isPresent()) {
            Person person = new Person();

            person.setDateOfBirth(json.getDateOfBirth());
            if (null != json.getFatherKey())
                person.setFatherKey(getPerson(json.getFatherKey()));
            if (null != json.getFatherKey())
                person.setMotherKey(getPerson(json.getMotherKey()));
            person.setGender(json.getGender());
            person.setKey(json.getKey());
            person.setName(json.getName());
            personRepository.save(person);
            return true;

        } else {
            throw new GenealogyException(String.format(AppConstants.ERROR_PERSON_DOES_NOT_EXIST, String.valueOf(key)), null);
        }
    }

    public void deletePerson(int key) throws GenealogyException {
        Optional<Person> personOptional = personRepository.findById(key);
        if (personOptional.isPresent()) {
            personRepository.delete(personOptional.get());
        } else {
            throw new GenealogyException(String.format(AppConstants.ERROR_PERSON_DOES_NOT_EXIST, String.valueOf(key)), null);
        }
    }
    
    public String getAncestors(Integer key) throws GenealogyException, JsonProcessingException {
        Optional<Person> personOptional = personRepository.findById(key);
        if(personOptional.isPresent()) {
            ObjectMapper mapper = new ObjectMapper();
            SimpleModule module = new SimpleModule();
            module.addSerializer(JsonView.class, new JsonViewSerializer());
            mapper.registerModule(module);
            String json = mapper.writeValueAsString(JsonView.with(personOptional.get())
                .onClass(Person.class, match()
                    .exclude("childrenf"))
                .onClass(Person.class, match()
                    .exclude("childrenm")));
            return json;
        } else {
            throw new GenealogyException(String.format(AppConstants.ERROR_PERSON_DOES_NOT_EXIST, String.valueOf(key)), null);
        }
    }
    
    public String getChildren(Integer key) throws GenealogyException, JsonProcessingException {
        Optional<Person> personOptional = personRepository.findById(key);
        if(personOptional.isPresent()) {
           // ObjectMapper mapper = new ObjectMapper();
            //String json = mapper.writeValueAsString(personOptional.get());
            ObjectMapper mapper = new ObjectMapper();
            SimpleBeanPropertyFilter theFilter = SimpleBeanPropertyFilter
              .serializeAllExcept("m","f");
            FilterProvider filters = new SimpleFilterProvider()
              .addFilter("myFilter", theFilter);
          String json = mapper.writer(filters).writeValueAsString(personOptional.get());
            return json;
        } else {
            throw new GenealogyException(String.format(AppConstants.ERROR_PERSON_DOES_NOT_EXIST, String.valueOf(key)), null);
        }
    }

}
