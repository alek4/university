import java.util.Objects;

// Le istanze di questa classe rappresentano dei giochi.
// Gli oggetti di questo tipo sono immutabili.
// Un giocattolo è rapprensentato da un nome e un materiale
public class Giocattolo {
  final private String nome;
  final private String materiale;

  // AF: "nome" di "materiale"
  // IR: nome != dalla stringa vuota e da null
  //     materiale != dalla stringa vuota e da null

  /** 
   * Constructor for class Giocattolo
   * @param n setta il nome del Giocattolo
   * @param m setta il materiale del Giocattolo
   * @throws IllegalArgumentException se le stringhe nome o materiale sono vuote
   * @throws NullPointerException se le stringhe nome o materiale son nulle
   */  
  public Giocattolo(final String n, final String m) {
    Objects.requireNonNull(n, "il nome non può essere nullo");
    Objects.requireNonNull(m, "il materiale non può essere nullo");
    
    if (n == "" || m == "") throw new IllegalArgumentException("il nome o il materiale non possono essere stringhe vuote");
    nome = n.toLowerCase();
    materiale = m.toLowerCase();
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder("");
    sb.append(nome);
    sb.append(" di ");
    sb.append(materiale);
    return sb.toString();
  }

  @Override
  public boolean equals(Object obj) {
    if (!(obj instanceof Giocattolo)) return false;
    Giocattolo other = (Giocattolo) obj;
    if (!nome.equals(other.nome) || !materiale.equals(other.materiale)) return false;
    return true;
  }

  @Override
  public int hashCode() {
    int result = 17;
    result = 31 * result + nome.hashCode();
    result = 31 * result + materiale.hashCode();
    return result;
  }
}
