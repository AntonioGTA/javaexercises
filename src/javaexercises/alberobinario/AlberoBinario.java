package alberobinario;

class AlberoBinario {
    Nodo radice;

    public AlberoBinario() {
        this.radice = null;
    }

    public void inserisci(String valoreStringa, int valoreInt) {
        radice = inserisciRicorsivo(radice, valoreStringa, valoreInt);
    }

    private Nodo inserisciRicorsivo(Nodo radice, String valoreStringa, int valoreInt) {
        if (radice == null) {
            return new Nodo(valoreStringa, valoreInt);
        }

        if (valoreInt < radice.valoreInt) {
            radice.sinistro = inserisciRicorsivo(radice.sinistro, valoreStringa, valoreInt);
        } else if (valoreInt > radice.valoreInt) {
            radice.destro = inserisciRicorsivo(radice.destro, valoreStringa, valoreInt);
        }

        return radice;
    }

    public void stampaAlbero() {
        stampaAlberoRicorsivo(radice);
    }

    private void stampaAlberoRicorsivo(Nodo radice) {
        if (radice != null) {
            System.out.println("Stringa: " + radice.valoreStringa + ", Intero: " + radice.valoreInt);
            stampaAlberoRicorsivo(radice.sinistro);
            stampaAlberoRicorsivo(radice.destro);
        }
    }

    public void stampaNodiFoglia() {
        stampaNodiFogliaRicorsivo(radice);
    }

    private void stampaNodiFogliaRicorsivo(Nodo radice) {
        if (radice != null) {
            if (radice.sinistro == null && radice.destro == null) {
                System.out.println("Stringa: " + radice.valoreStringa + ", Intero: " + radice.valoreInt);
            }
            stampaNodiFogliaRicorsivo(radice.sinistro);
            stampaNodiFogliaRicorsivo(radice.destro);
        }
    }
}
