package nl.rivm.dvp.nhs.business.model;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
public class Hielprik {
    // List<Screening> screening;
    LocalDateTime geboorteMoment;
    LocalDateTime afnameMoment;
    Integer zwangerschapsduur;
    Integer afnametermijnPrematuur;
    Integer geboortegewicht;
    Boolean bloedtransfusie;
    String bloedtransfusieType;
    LocalDateTime bloedtransfusieMoment;
    String hielprikType;

    public static Long urenVerschil(LocalDateTime start, LocalDateTime einde) {
        if (start != null && einde != null) {
            Long verschilInUren = ChronoUnit.HOURS.between(start, einde);
            return verschilInUren;
        } else {
            return null;
        }
    };

    public static Boolean beideTijdenBekend(LocalDateTime start, LocalDateTime einde) {
        if (start != null && einde != null) {
            return (start.toLocalTime() != LocalTime.MIDNIGHT &&
                    einde.toLocalTime() != LocalTime.MIDNIGHT);
        } else {
            return null;
        }
    };
};
