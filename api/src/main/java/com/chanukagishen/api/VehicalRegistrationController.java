package com.chanukagishen.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class VehicalRegistrationController {

    @Autowired
    private ServiceControlller controller;

    @PostMapping("register/")
    public VehicalRegistrationDetails Register(@RequestBody VehicalRegistrationDetails details) {
        return controller.save(details);
    }

    @GetMapping("getDetails/")
    public List<VehicalRegistrationDetails> list() {
        return controller.list();
    }

    @PostMapping("delete/")
    public void delete(@RequestBody VehicalRegistrationDetails details) {
        controller.delete(details);
    }

    @PostMapping("update/")
    public VehicalRegistrationDetails update(@RequestBody VehicalRegistrationDetails details) {
        return controller.update(details);
    }

}
