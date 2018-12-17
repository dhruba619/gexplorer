package org.genealogy.explorer.controller;

import java.util.ArrayList;
import java.util.List;

import org.genealogy.explorer.entities.Person;
import org.genealogy.explorer.json.BulkPersonRequest;
import org.genealogy.explorer.json.GenericResponse;
import org.genealogy.explorer.json.PersonJson;
import org.genealogy.explorer.service.PersonService;
import org.genealogy.explorer.utils.AppConstants;
import org.genealogy.explorer.utils.GenealogyException;
import org.genealogy.explorer.utils.PersonValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@RestController
@RequestMapping(path = "/GE")
public class PersonApi {

    @Autowired
    private PersonService personService;

    @Autowired
    PersonValidator validator;

    Logger log = LoggerFactory.getLogger(PersonApi.class);

    @RequestMapping(path = "/person/add", params = { "key", "name", "dob", "m", "f", "g" }, method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<GenericResponse> add(@RequestParam("key") int key, @RequestParam("name") String name, @RequestParam("dob") int dateOfBirth, @RequestParam("m") int motherKey, @RequestParam("f") int fatherKey, @RequestParam("g") String gender) {

        PersonJson person = new PersonJson();
        person.setKey(key);
        person.setName(name);
        person.setDateOfBirth(dateOfBirth);
        person.setMotherKey(motherKey);
        person.setFatherKey(fatherKey);
        person.setGender(gender);
        try {

            validator.validate(person);
            personService.createPerson(person);

            return ResponseEntity.status(HttpStatus.OK)
                .body(new GenericResponse(AppConstants.RESULT_SUCCESS, null));
        } catch (GenealogyException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new GenericResponse(AppConstants.RESULT_FAILED, e.getErrorMessage()));
        }
    }

    @RequestMapping(path = "/person/addJson", method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<GenericResponse> addJson(@RequestBody String request) {

        ObjectMapper mapper = new ObjectMapper();
        PersonJson person = null;
        BulkPersonRequest bulkPersonRequest = null;
        try {
            person = mapper.readValue(request, PersonJson.class);
        } catch (Exception e) {
            log.error(e.getMessage());
            try {
                bulkPersonRequest = mapper.readValue(request, BulkPersonRequest.class);
            } catch (Exception ex) {
                log.error(ex.getMessage());
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new GenericResponse(AppConstants.RESULT_FAILED, null));
            }
        }
        try {
            if (null != person) {
                validator.validate(person);
                personService.createPerson(person);
            } else if (null != bulkPersonRequest) {
                validator.validate(bulkPersonRequest);

                List<Person> persons = new ArrayList<>();
                for (PersonJson json : bulkPersonRequest.getList()) {
                    Person p2 = new Person();

                    p2.setDateOfBirth(json.getDateOfBirth());
                    if (null != json.getFatherKey())
                        p2.setFatherKey(personService.getPerson(json.getFatherKey()));
                    if (null != json.getMotherKey())
                        p2.setMotherKey(personService.getPerson(json.getMotherKey()));
                    p2.setGender(json.getGender());
                    p2.setKey(json.getKey());
                    p2.setName(json.getName());
                    persons.add(p2);
                }
                personService.createPeople(persons);
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new GenericResponse(AppConstants.RESULT_FAILED, null));
            }

            return ResponseEntity.status(HttpStatus.OK)
                .body(new GenericResponse(AppConstants.RESULT_SUCCESS, null));
        } catch (GenealogyException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new GenericResponse(AppConstants.RESULT_FAILED, e.getErrorMessage()));
        }
    }

    @RequestMapping(path = "/person/delete/{key}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<GenericResponse> delete(@PathVariable("key") int key) {
        try {
            personService.deletePerson(key);
            return ResponseEntity.status(HttpStatus.OK)
                .body(new GenericResponse(AppConstants.RESULT_SUCCESS, null));
        } catch (GenealogyException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new GenericResponse(AppConstants.RESULT_FAILED, e.getErrorMessage()));
        }
    }

    @RequestMapping(path = "/person/get/{key}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> get(@PathVariable("key") int key) throws JsonProcessingException {
        try {
            Person person = personService.getPerson(key);

            PersonJson json = new PersonJson();
            json.setKey(person.getKey());
            json.setDateOfBirth(person.getDateOfBirth());
            if (null != person.getFatherKey())
                json.setFatherKey(person.getFatherKey()
                    .getKey());
            if (null != person.getMotherKey())
                json.setMotherKey(person.getMotherKey()
                    .getKey());
            json.setGender(person.getGender());
            json.setName(person.getName());
            ObjectMapper mapper = new ObjectMapper();

            return ResponseEntity.status(HttpStatus.OK)
                .body(mapper.writeValueAsString(json));
        } catch (GenealogyException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new Gson().toJson(new GenericResponse(AppConstants.RESULT_FAILED, e.getErrorMessage())));
        } catch (JsonProcessingException ex) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new Gson().toJson(new GenericResponse(AppConstants.RESULT_FAILED, ex.getMessage())));
        }
    }

    @RequestMapping(path = "/person/edit/{key}", method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity<GenericResponse> update(@PathVariable("key") int key, @RequestBody PersonJson person) {
        try {

            validator.validate(person);
            personService.updatePerson(key, person);
            return ResponseEntity.status(HttpStatus.OK)
                .body(new GenericResponse(AppConstants.RESULT_SUCCESS, null));
        } catch (GenealogyException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new GenericResponse(AppConstants.RESULT_FAILED, e.getErrorMessage()));
        }
    }

    @RequestMapping(path = "/person/ancestors/{key}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> getAncestors(@PathVariable("key") int key) {

        try {
            String person = personService.getAncestors(key);

            return ResponseEntity.status(HttpStatus.OK)
                .body(person);
        } catch (GenealogyException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new Gson().toJson(new GenericResponse(AppConstants.RESULT_FAILED, e.getErrorMessage())));
        } catch (JsonProcessingException ex) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new Gson().toJson(new GenericResponse(AppConstants.RESULT_FAILED, ex.getMessage())));
        }
    }
    
    @RequestMapping(path = "/person/descendants/{key}", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity<String> getDecendants(@PathVariable("key") int key) {
        try {
            String person = personService.getChildren(key);

            return ResponseEntity.status(HttpStatus.OK)
                .body(person);
        } catch (GenealogyException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new Gson().toJson(new GenericResponse(AppConstants.RESULT_FAILED, e.getErrorMessage())));
        } catch (JsonProcessingException ex) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                .body(new Gson().toJson(new GenericResponse(AppConstants.RESULT_FAILED, ex.getMessage())));
        }
    }

}
