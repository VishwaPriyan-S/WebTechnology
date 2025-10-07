<%@ page import="javax.xml.transform.*,javax.xml.transform.stream.*,java.io.*" %>
<%
    String xmlFile = application.getRealPath("feedback.xml");
    String xslFile = application.getRealPath("feedback.xsl");

    TransformerFactory factory = TransformerFactory.newInstance();
    Transformer transformer = factory.newTransformer(new StreamSource(new File(xslFile)));
    transformer.transform(new StreamSource(new File(xmlFile)), new StreamResult(out));
%>
