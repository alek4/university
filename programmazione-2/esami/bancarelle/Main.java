/**
 * main
 */
public class Main {

  public static void main(String[] args) {
    Giocattolo g = new Giocattolo("fica", "gomma");
    Giocattolo g2 = new Giocattolo("fic3a", "gomma");

    Inventario inv = new Inventario();

    inv.aggiungi(g, 1);
    inv.aggiungi(g, 1);
    inv.aggiungi(g2, 10);
    
    System.out.println(g.equals(g2));
  }
}