public class Soluzione {
    public static void main(String[] args) {
        Indirizzo ind = new Indirizzo("massimo.santini", "cazzi.com");
        Alias alias = new Alias("nome", ind.dominio);
        alias.addLocale(ind.locale);
        
        ind = new Indirizzo("massimo.dalaef", "cazzi.com");
        alias.addLocale(ind.locale);

        ind = new Indirizzo("luca.dalaef", "cazzi.com");
        alias.addLocale(ind.locale);

        ListeDistribuzione ld = new ListeDistribuzione("cazzone", alias);

        ind = new Indirizzo("massimo.santini", "ugagua.com");
        alias = new Alias("nome", ind.dominio);
        alias.addLocale(ind.locale);
        
        ind = new Indirizzo("massimo.dalaef", "ugauga.com");
        alias.addLocale(ind.locale);

        ind = new Indirizzo("luca.dalaef", "ugauga.com");
        alias.addLocale(ind.locale);

        ListeDistribuzione ld2 = new ListeDistribuzione("ufaf1", alias);
        ld = ld.addLista("affaculo", ld2);

        for (Indirizzo indirizzo : ld) {
            System.out.println(indirizzo);
        }
    }
}
