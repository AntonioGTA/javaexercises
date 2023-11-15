package alberobinario;

public class Main {
    public static void main(String[] args) {
        AlberoBinario alberoBinario = new AlberoBinario();

        alberoBinario.inserisci("Nodo1", 5);
        alberoBinario.inserisci("Nodo2", 3);
        alberoBinario.inserisci("Nodo3", 8);
        alberoBinario.inserisci("Nodo4", 1);
        alberoBinario.inserisci("Nodo5", 4);
        alberoBinario.inserisci("Nodo6", 7);
        alberoBinario.inserisci("Nodo7", 9);
        alberoBinario.inserisci("Nodo8", 2);
        alberoBinario.inserisci("Nodo9", 6);
        alberoBinario.inserisci("Nodo10", 10);
        alberoBinario.inserisci("Nodo11", 12);
        alberoBinario.inserisci("Nodo12", 11);

        System.out.println("Info String e Int di ciascun nodo:");
        System.out.println(" ");
        alberoBinario.stampaAlbero();
        
        System.out.println(" ");
        System.out.println(" ");

        System.out.println("Info dei soli nodi foglia:");
        System.out.println(" ");
        alberoBinario.stampaNodiFoglia();
    }
}