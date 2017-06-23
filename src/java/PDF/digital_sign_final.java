/*
 * This class is part of the white paper entitled
 * "Digital Signatures for PDF documents"
 * written by Bruno Lowagie
 * 
 * For more info, go to: http://itextpdf.com/learn
 */
package PDF;
 
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.Security;
import java.security.cert.Certificate;
 
import org.bouncycastle.jce.provider.BouncyCastleProvider;
 
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfSignatureAppearance;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.security.BouncyCastleDigest;
import com.itextpdf.text.pdf.security.DigestAlgorithms;
import com.itextpdf.text.pdf.security.ExternalDigest;
import com.itextpdf.text.pdf.security.ExternalSignature;
import com.itextpdf.text.pdf.security.MakeSignature;
import com.itextpdf.text.pdf.security.MakeSignature.CryptoStandard;
import com.itextpdf.text.pdf.security.PrivateKeySignature;
 
public class digital_sign_final {
    
    public String digital_sign_final() throws GeneralSecurityException, IOException, DocumentException{
        //id_usuario = id_prof;
        //SRC = "C:\\\\psf\\\\Home\\\\Documents\\\\Reporte_de_resultados_E-SIBE.pdf";
        //DEST = "C:\\\\psf\\\\Home\\\\Documents\\\\Reporte_de_resultados_E-SIBE_seguro.pdf";
        SRC = ".\\\\bin\\\\apache-tomcat-8.0.43\\\\webapps\\\\Usuarios\\\\Reporte_de_resultados_E-SIBE.pdf";
        DEST = ".\\\\bin\\\\apache-tomcat-8.0.43\\\\webapps\\\\Usuarios\\\\Reporte_de_resultados_E-SIBE_seguro.pdf";
        String i = execute();
        return "done";
    }
        //public String id_usuario;
	//public static final String KEYSTORE = "C:\\\\psf\\\\Home\\\\Documents\\\\E-SIBE2017.pfx";
        public static final String KEYSTORE = ".\\\\bin\\\\apache-tomcat-8.0.43\\\\webapps\\\\Usuarios\\\\E-SIBE2017.pfx";
	public static final char[] PASSWORD = "iron_maiden".toCharArray();
	//public static final String SRC = "C:\\\\psf\\\\Home\\\\Documents\\\\Reporte_de_resultados_E-SIBE.pdf";
	//public static final String DEST = "C:\\\\psf\\\\Home\\\\Documents\\\\Reporte_de_resultados_E-SIBE_firmado.pdf";
        public String SRC/* = "C:\\\\psf\\\\Home\\\\Documents\\\\" + id_usuario + "\\\\Reporte_de_Actividades_E-SIBE_" + id_usuario + ".pdf"*/;
	public String DEST/* = "C:\\\\psf\\\\Home\\\\Documents\\\\" + id_usuario + "\\\\Reporte_de_Actividades_E-SIBE_" + id_usuario + "_seguro.pdf"*/;
 
	public void sign(String src, String dest,
			Certificate[] chain,
			PrivateKey pk, String digestAlgorithm, String provider,
			CryptoStandard subfilter,
			String reason, String location)
					throws GeneralSecurityException, IOException, DocumentException {
        // Creating the reader and the stamper
        PdfReader reader = new PdfReader(src);
        FileOutputStream os = new FileOutputStream(dest);
        PdfStamper stamper = PdfStamper.createSignature(reader, os, '\0');
        // Creating the appearance
        PdfSignatureAppearance appearance = stamper.getSignatureAppearance();
        appearance.setReason(reason);
        appearance.setLocation(location);
        //appearance.setVisibleSignature(new Rectangle(36, 748, 144, 780), 1, "sig");
        appearance.setVisibleSignature(new Rectangle(20, 400, 80, 600), 1, "sig");
        // Creating the signature
        ExternalDigest digest = new BouncyCastleDigest();
        ExternalSignature signature = new PrivateKeySignature(pk, digestAlgorithm, provider);
        MakeSignature.signDetached(appearance, digest, signature, chain, null, null, null, 0, subfilter);
	}
 
	public String execute() throws GeneralSecurityException, IOException, DocumentException {
		BouncyCastleProvider provider = new BouncyCastleProvider();
		Security.addProvider(provider);
		KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
		ks.load(new FileInputStream(KEYSTORE), PASSWORD);
        String alias = (String)ks.aliases().nextElement();
        PrivateKey pk = (PrivateKey) ks.getKey(alias, PASSWORD);
        Certificate[] chain = ks.getCertificateChain(alias);
		digital_sign app = new digital_sign();
		app.sign(SRC, String.format(DEST, 1), chain, pk, DigestAlgorithms.SHA256, provider.getName(), CryptoStandard.CMS, "Firma de autenticación E-SIBE", "Ghent");
		app.sign(SRC, String.format(DEST, 2), chain, pk, DigestAlgorithms.SHA512, provider.getName(), CryptoStandard.CMS, "Firma de autenticación E-SIBE", "Ghent");
		app.sign(SRC, String.format(DEST, 3), chain, pk, DigestAlgorithms.SHA256, provider.getName(), CryptoStandard.CADES, "Firma de autenticación E-SIBE", "Ghent");
		app.sign(SRC, String.format(DEST, 4), chain, pk, DigestAlgorithms.RIPEMD160, provider.getName(), CryptoStandard.CADES, "Firma de autenticación E-SIBE", "Ghent");
                System.out.println("Aquí llega");
                return "success";
	}
}
