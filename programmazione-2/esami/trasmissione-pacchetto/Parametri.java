import java.nio.charset.Charset;
import java.util.zip.Checksum;

record Parametri(int dimensione, Charset charset, Checksum algoritmo) {
}