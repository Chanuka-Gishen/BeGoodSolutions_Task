package com.chanukagishen.api;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class VehicalRegistrationDetails {
    @Id
    @GeneratedValue
    Integer id;

    String ownerName;
    String ownerIdNumber;
    String licensePlate;
    String vehicleModel;

}
