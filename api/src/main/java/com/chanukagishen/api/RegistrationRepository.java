package com.chanukagishen.api;

import org.springframework.data.jpa.repository.JpaRepository;

public interface RegistrationRepository extends JpaRepository<VehicalRegistrationDetails, Integer> {
}
