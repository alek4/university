import java.nio.charset.Charset;
import java.util.zip.Adler32;

public class Soluzione {

    public static void main(String[] args) {

        final int dimensione = Integer.parseInt(args[0]);
        final Charset charset = Charset.forName(args[1]);
        final Parametri parametri = new Parametri(dimensione, charset, new Adler32());

        final Destinatario destinatario = new DestinatarioElementare(parametri);
        final Canale canale = new CanaleElementare(destinatario);
        final Sorgente sorgente = new SorgenteElementare(canale);
        sorgente.trasmetti(args[2]);
    }
}
