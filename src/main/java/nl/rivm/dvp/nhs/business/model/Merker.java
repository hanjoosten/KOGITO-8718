package nl.rivm.dvp.nhs.business.model;

import lombok.Data;

@Data
public class Merker {
    String naam;
    Float waardeNum;
    String waardeString;
    String classificatie;
    Integer status;
}
