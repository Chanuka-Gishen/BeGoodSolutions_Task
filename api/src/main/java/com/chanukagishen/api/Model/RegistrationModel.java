package com.chanukagishen.api.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RegistrationModel {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Integer id;

    public String ownerName;
    public String licensePlate;
    public String ownerNic;
    public String vehicalType;

    public RegistrationModel() {
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOwnerName() {
        return this.ownerName;
    }

    public void setOwnerName(String name) {
        this.ownerName = name;
    }

    public String getLicensePlate() {
        return this.licensePlate;
    }

    public void setLicensePlate(String no) {
        this.licensePlate = no;
    }

    public String getOwnerNic() {
        return this.ownerNic;
    }

    public void setOwnerNic(String nic) {
        this.ownerNic = nic;
    }

    public String getVehicalType() {
        return this.vehicalType;
    }

    public void getVehicalType(String type) {
        this.vehicalType = type;
    }

}
