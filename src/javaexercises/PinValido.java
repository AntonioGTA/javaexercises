package javaexercises;

public class PinValido {
    public static void main(String[] args) {
        String pin1 = "1234";
        String pin2 = "123456";
        String pin3 = "0123456";
        String pin4 = "12 34";
        String pin5 = "123A";
       

        stampaRisultato(pin1);
        stampaRisultato(pin2);
        stampaRisultato(pin3);
        stampaRisultato(pin4);
        stampaRisultato(pin5);
    }

    public static void stampaRisultato(String pin) {
        String risultato = verificaPIN(pin);

        if (risultato.equals("Valido")) {
            System.out.println("Il PIN " + pin + " è valido.");
        } else {
            System.out.println("Il PIN " + pin + " non è valido.");
        }
    }

    public static String verificaPIN(String pin) {
    
        String pattern = "^(\\d{4}|\\d{6})$";
        if (pin.matches(pattern) && !pin.contains(" ")) {
            return "Valido";
        } else {
            return "Non Valido";
        }
    }
}




