package com.chanukagishen.api.Controller;

import java.util.List;

import com.chanukagishen.api.Model.RegistrationModel;
import com.chanukagishen.api.Service.ServiceClass;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
public class ApiController {

    @Autowired
    private ServiceClass sClass;

    @PostMapping("register/")
    public String register(@RequestBody RegistrationModel model) {
        return sClass.registerLicensePlate(model);
    }

    @GetMapping("getAllDetails/")
    public List<RegistrationModel> getAllRegistrations() {
        return sClass.getAllDetails();
    }

    @PutMapping("updateRegistration/")
    public String updateRegistrations(@RequestBody RegistrationModel model) {
        return sClass.updateRegistration(model);
    }

    @DeleteMapping("deleteRegistration/")
    public String removeRegistration(@RequestBody RegistrationModel model) {
        return sClass.removeRegistration(model);
    }
}
