package distanzaMassima;

public class Main {

    public static void main(String[] args) {

        CalcolaDistanzaMax calcolaDistanzaMax = new CalcolaDistanzaMax();

        System.out.println("Distanza massima con 70 litri di carburante, consumo di 7 litri ogni 100km, senza altri passeggeri a bordo e aria condizionata spenta: " + calcolaDistanzaMax.distanzaTotale(70.0, 7.0, 0, false));
        System.out.println("Distanza massima con 36.1 litri di carburante, consumo di 8.6 litri ogni 100km, 3 passeggeri a bordo e aria condizionata accesa: " + calcolaDistanzaMax.distanzaTotale(36.1, 8.6, 3, true));
        System.out.println("Distanza massima con 55.5 litri di carburante, consumo di 5.5 litri ogni 100km, 5 passeggeri a bordo e aria condizionata spenta: " + calcolaDistanzaMax.distanzaTotale(55.5, 5.5, 5, false));
    }

}
