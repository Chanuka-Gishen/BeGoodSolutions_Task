package com.chanukagishen.api.LicensePlateValidator;

import com.chanukagishen.api.PlateNoModel.PlateNoModel;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*")
public class NumberValidator {

    @PostMapping("getType/")
    public String getType(@RequestBody PlateNoModel plateNoModel) {
        String no = plateNoModel.getLicensePlateNumber();
        if (oldFirstCondition(no) || oldSecondCondition(no)) {
            return "Old";
        } else if (vintageCondition(no) || vintageSecondCondition(no)) {
            return "Vintage";
        } else if (modernFirstCondition(no) || modernSecondCondition(no)) {
            return "Modern";
        }
        return "Incorrent Number";

    }

    @PostMapping("validType/")
    public Boolean validType(@RequestBody PlateNoModel plateNoModel) {
        String no = plateNoModel.getLicensePlateNumber();
        if (oldFirstCondition(no) || oldSecondCondition(no)) {
            return true;
        } else if (vintageCondition(no) || vintageSecondCondition(no)) {
            return true;
        } else if (modernFirstCondition(no) || modernSecondCondition(no)) {
            return true;
        }
        return false;

    }

    public static boolean oldFirstCondition(String no) {
        boolean ok = false;
        if (no.matches("^[0-9]{2}-[0-9]{4}$") || no.matches("^[0-9]{2}\\s+-\\s+[0-9]{4}$")) {
            ok = true;
        }
        return ok;
    }

    public static boolean oldSecondCondition(String no) {
        boolean ok = false;
        if (no.matches("^[0-9]{3}-[0-9]{4}$") || no.matches("^[0-9]{3}\\s+-\\s+[0-9]{4}$")) {
            ok = true;
        }
        return ok;
    }

    public static boolean vintageCondition(String no) {
        boolean ok = false;
        if (no.matches("^[0-9]{2}ශ්\u200Dරී[0-9]{4}$")) {
            ok = true;
        }
        return ok;
    }

    public static boolean vintageSecondCondition(String no) {
        boolean ok = false;
        if (no.matches("^[0-9]{2}\\s+ශ්\u200Dරී\\s+[0-9]{4}$")) {
            ok = true;
        }
        return ok;
    }

    public static boolean modernFirstCondition(String no) {
        boolean ok = false;
        if (no.matches("^[a-zA-Z]{3}-[0-9]{4}") || no.matches("^[a-zA-Z]{3}\\s+-\\s+[0-9]{4}")) {
            ok = true;
        }
        return ok;
    }

    public static boolean modernSecondCondition(String no) {
        boolean ok = false;
        if (no.matches("[a-zA-Z]{2}\\s[a-zA-Z]{2}-[0-9]{4}")
                || no.matches("[a-zA-Z]{2}\\s+[a-zA-Z]{2}\\s+-\\s+[0-9]{4}")) {
            ok = true;
        }
        return ok;
    }
}
