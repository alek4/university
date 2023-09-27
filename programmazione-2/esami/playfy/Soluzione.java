public class Soluzione {

  public static void main(String[] args) {
    Durata d = new Durata(123);
    Durata d2 = Durata.fromString("1:4:12");
    System.out.println(d);
    System.out.println(d2);
  }
}
