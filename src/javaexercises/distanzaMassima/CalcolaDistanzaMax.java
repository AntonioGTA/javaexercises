package distanzaMassima;

public class CalcolaDistanzaMax {

    public static double distanzaTotale(double carburante, double carburanteUtilizzo, int passeggeri, boolean ariaCondizionata) {
      
        double consumoBase = carburanteUtilizzo + (carburanteUtilizzo * 0.05 * passeggeri);

        if (ariaCondizionata) {
            consumoBase += consumoBase * 0.1;
        }

        double distanzaMassima = (carburante / consumoBase) * 100;

        distanzaMassima = Math.round(distanzaMassima * 100.0) / 100.0;

        return distanzaMassima;
    }

}
