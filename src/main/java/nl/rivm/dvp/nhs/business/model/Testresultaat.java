package nl.rivm.dvp.nhs.business.model;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter

@Builder
public class Testresultaat {
    String merker;
    Float waardeNum;
    String waardeString;
    Integer status;
}
