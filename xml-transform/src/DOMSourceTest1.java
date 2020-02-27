import java.io.IOException;
import javax.xml.parsers.FactoryConfigurationError;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.dom.DOMSource;
import org.w3c.dom.Document;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.xml.sax.SAXException;
import org.w3c.dom.ls.DOMImplementationLS;
import org.w3c.dom.ls.LSSerializer;


/**
 * @author asawhney21
 *
 */
public class DOMSourceTest1 {


    public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException, TransformerException {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        dbf.setNamespaceAware(true);
        DocumentBuilder db = dbf.newDocumentBuilder();
        Document xslt = db.parse("TxTemplate.xsl");
        Document xml = db.parse("TxTnput.xml");
        Document result = transformXML(xml, xslt);
        LSSerializer serializer = ((DOMImplementationLS) xml.getImplementation()).createLSSerializer();
        System.out.println(serializer.writeToString(result));
    }

    public static Document transformXML(Document xml, Document xslt) throws TransformerException, ParserConfigurationException, FactoryConfigurationError {

        Source xmlSource = new DOMSource(xml);
        Source xsltSource = new DOMSource(xslt);
        DOMResult result = new DOMResult();

        // the factory pattern supports different XSLT processors
        TransformerFactory transFact
                = TransformerFactory.newInstance();
        Transformer trans = transFact.newTransformer(xsltSource);

        trans.transform(xmlSource, result);

        Document resultDoc = (Document) result.getNode();

        return resultDoc;
    }
}