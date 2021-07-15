package com.chanukagishen.api.Service;

// import java.util.List;
// import java.util.Optional;

// import com.chanukagishen.api.Model.RegistrationModel;
// import com.chanukagishen.api.Repository.RegistrationRepository;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Service;

//@Service
public class ServiceClass {

    // @Autowired
    // RegistrationRepository registrationRepository;

    // public List<RegistrationModel> getAllDetails() {
    // try {
    // List<RegistrationModel> details = registrationRepository.findAll();
    // return details;
    // } catch (Exception e) {
    // throw e;
    // }
    // }

    // public String registerLicensePlate(RegistrationModel registrationModel) {
    // try {
    // if
    // (!registrationRepository.existsByLicensePlate(registrationModel.getLicensePlate()))
    // {
    // registrationRepository.save(registrationModel);
    // return "1";
    // } else {
    // return "0";
    // }
    // } catch (Exception e) {
    // throw e;
    // }
    // }

    // public String removeRegistration(RegistrationModel registrationModel) {
    // try {
    // if
    // (registrationRepository.existsByLicensePlate(registrationModel.getLicensePlate()))
    // {
    // registrationRepository.delete(registrationModel);
    // return "1";
    // } else {
    // return "0";
    // }
    // } catch (Exception e) {
    // throw e;
    // }
    // }

    // public String updateRegistration(RegistrationModel registrationModel) {
    // try {
    // if (registrationRepository.existsById(registrationModel.getId())) {
    // registrationRepository.save(registrationModel);
    // return "1";
    // } else {
    // return "0";
    // }
    // } catch (Exception e) {
    // throw e;
    // }
    // }

    // public RegistrationModel getDetail(Integer id) {
    // Optional<RegistrationModel> some = registrationRepository.findById(id);
    // if (some.isPresent()) {
    // return some.get();
    // } else {
    // return null;
    // }

    // // some.isPresent();
    // // some.empty()

    // // return registrationRepository.findById(id);
    // }

}
