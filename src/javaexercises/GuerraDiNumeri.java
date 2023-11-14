package javaexercises;

import java.util.Arrays;

public class GuerraDiNumeri {
    public static void main(String[] args) {

        int[] numeri = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0};
        int differenza = differenzaSommaPariDispari(numeri);
        System.out.println("differenza tra somma dei numeri pari e di quelli dispari: " + differenza);
    }

    public static int differenzaSommaPariDispari(int[] arrayNumeri) {
        int sommaPari = 0;
        int sommaDispari = 0;

        for (int numero : arrayNumeri) {
            if (numero % 2 == 0) {
            
                sommaPari += numero;
            } else {
            
                sommaDispari += numero;
            }
        }

        return sommaDispari - sommaPari;
    }
}

