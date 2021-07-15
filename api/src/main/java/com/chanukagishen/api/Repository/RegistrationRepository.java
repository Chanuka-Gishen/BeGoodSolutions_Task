package com.chanukagishen.api.Repository;

import com.chanukagishen.api.Model.RegistrationModel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RegistrationRepository extends JpaRepository<RegistrationModel, Long> {

}
