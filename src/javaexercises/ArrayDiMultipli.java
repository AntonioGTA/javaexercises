package javaexercises;

import java.util.Arrays;

public class ArrayDiMultipli {
    public static void main(String[] args) {
        int[] array1 = arrayDiMultipli(7, 5);
        System.out.println("arrayDiMultipli(7, 5): " + Arrays.toString(array1));

        int[] array2 = arrayDiMultipli(12, 10);
        System.out.println("arrayDiMultipli(12, 10): " + Arrays.toString(array2));

        int[] array3 = arrayDiMultipli(17, 6);
        System.out.println("arrayDiMultipli(17, 6): " + Arrays.toString(array3));
    }

    public static int[] arrayDiMultipli(int num, int lunghezza) {
        int[] arrayDiMultipli = new int[lunghezza];
        for (int i = 0; i < lunghezza; i++) {
            arrayDiMultipli[i] = num * (i + 1);
        }
        return arrayDiMultipli;
    }
}

