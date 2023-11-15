package javaexercises;

public class InversioneIntero {
    public static String rev(int n) {
    	
        int numeroPositivo = Math.abs(n);
        
        String numeroStringa = Integer.toString(numeroPositivo);
        
        StringBuilder inversioneStringa = new StringBuilder(numeroStringa).reverse();
        
        return inversioneStringa.toString();
    }

    public static void main(String[] args) {
    	System.out.println("Numeri con le cifre invertire:");
        System.out.println("rev(5121): " + rev(5121));
        System.out.println("rev(69): " + rev(69));
        System.out.println("rev(-122157): " + rev(-122157));
    }
}
