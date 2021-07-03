package com.chanukagishen.api;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
public class LicensePlate {

    @GetMapping("findType/")
    public String findLicensePlateType(@RequestBody String platNo) {

        if (platNo.equals("19-9999")) {
            return "done";
        }

        if (oldFirstCondition(platNo) || oldSecondCondition(platNo)) {
            return "Vintage";
        } else {
            if (vintageCondition(platNo) || vintageSecondCondition(platNo)) {
                return "Old";
            } else {
                if (modernFirstCondition(platNo) || modernSecondCondition(platNo)) {
                    return "Modern";
                }
            }
        }
        return null;
    }

    public boolean returnInt() {
        return true;
    }

    public boolean oldFirstCondition(String no) {
        boolean ok = false;
        if (no.matches("^[0-9]{2}-[0-9]{4}$") || no.matches("^[0-9]{2}\\s+-\\s+[0-9]{4}$")) {
            ok = true;
        }
        return ok;
    }

    public boolean oldSecondCondition(String no) {
        boolean ok = false;
        if (no.matches("^[0-9]{3}-[0-9]{4}$") || no.matches("^[0-9]{3}\\s+-\\s+[0-9]{4}$")) {
            ok = true;
        }
        return ok;
    }

    public boolean vintageCondition(String no) {
        boolean ok = false;
        if (no.matches("^[0-9]{2}ශ්\u200Dරී[0-9]{4}$")) {
            ok = true;
        }
        return ok;
    }

    public boolean vintageSecondCondition(String no) {
        boolean ok = false;
        if (no.matches("^[0-9]{2}\\s+ශ්\u200Dරී\\s+[0-9]{4}$")) {
            ok = true;
        }
        return ok;
    }

    public boolean modernFirstCondition(String no) {
        boolean ok = false;
        if (no.matches("^[a-zA-Z]{3}-[0-9]{4}") || no.matches("^[a-zA-Z]{3}\\s+-\\s+[0-9]{4}")) {
            ok = true;
        }
        return ok;
    }

    public boolean modernSecondCondition(String no) {
        boolean ok = false;
        if (no.matches("^[a-zA-Z]{2}\\s[a-zA-Z]{2}-[0-9]{4}$")
                || no.matches("^[a-zA-Z]{2}\\s+[a-zA-Z]{2}\\s+-\\s+[0-9]{4}$")) {
            ok = true;
        }
        return ok;
    }

}
