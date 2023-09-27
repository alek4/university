public class DestinatarioElementare extends DestinatarioAbs {

  public DestinatarioElementare(Parametri parametri) {
    super(parametri);
  }

  @Override
  public boolean ricevi(Pacchetto pacchetto) {
    if (pacchetto == null) {
      int bytesSize = bytes.size();
      byte[] bytesArray = new byte[bytesSize];
      for (int i = 0; i < bytesArray.length; i++) {
        bytesArray[i] = bytes.get(i);
      }
      String messaggio = new String(bytesArray, parametri.charset()); 
      System.out.println(messaggio);
    } else {
      for (int i = 0; i < pacchetto.contenuto().length; i++) {
        bytes.add(pacchetto.contenuto()[i]);
      }
      // System.out.println("Destinatario: Ho ricevto" + bytes.toString());
    }

    return true;
  }

}
