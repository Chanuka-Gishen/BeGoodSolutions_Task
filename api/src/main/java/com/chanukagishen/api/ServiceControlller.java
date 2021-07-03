package com.chanukagishen.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceControlller {

    @Autowired
    private RegistrationRepository repository;

    public List<VehicalRegistrationDetails> list() {
        return repository.findAll();
    }

    public VehicalRegistrationDetails save(VehicalRegistrationDetails details) {
        return repository.save(details);
    }

    public void delete(VehicalRegistrationDetails details) {
        repository.deleteById(details.getId());
    }

    public VehicalRegistrationDetails update(VehicalRegistrationDetails details) {
        VehicalRegistrationDetails newDetails = repository.findById(details.getId()).orElse(null);
        newDetails.setOwnerName(details.getOwnerName());
        newDetails.setOwnerIdNumber(details.getOwnerIdNumber());
        newDetails.setLicensePlate(details.getLicensePlate());
        newDetails.setVehicleModel(details.getVehicleModel());

        return repository.save(newDetails);
    }

}
