# jenkins
Tests of jenkins

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

public class CalculJoursOuvrables {
    public static void main(String[] args) {
        LocalDate dateDebut = LocalDate.of(2023, 1, 1);
        LocalDate dateFin = LocalDate.of(2023, 12, 31);

        long joursOuvrables = calculerJoursOuvrables(dateDebut, dateFin);
        
        System.out.println("Nombre de jours ouvrables : " + joursOuvrables);
    }

    public static long calculerJoursOuvrables(LocalDate debut, LocalDate fin) {
        long joursTotals = ChronoUnit.DAYS.between(debut, fin) + 1;
        long joursOuvrables = joursTotals;

        for (LocalDate date = debut; !date.isAfter(fin); date = date.plusDays(1)) {
            if (estWeekend(date) || estJourFerie(date)) {
                joursOuvrables--;
            }
        }

        return joursOuvrables;
    }

    public static boolean estWeekend(LocalDate date) {
        DayOfWeek dayOfWeek = date.getDayOfWeek();
        return dayOfWeek == DayOfWeek.SATURDAY || dayOfWeek == DayOfWeek.SUNDAY;
    }

    public static boolean estJourFerie(LocalDate date) {
        // Ajoutez votre logique pour vérifier si la date est un jour férié
        // par exemple, en comparant avec une liste prédéfinie de jours fériés.
        return false;
    }
}
