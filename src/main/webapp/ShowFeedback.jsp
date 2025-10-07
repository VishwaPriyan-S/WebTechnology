<%@ page import="java.io.File" %>
<%@ page import="javax.xml.transform.*,javax.xml.transform.stream.*" %>
<%
    String xmlFile = application.getRealPath("ice_cream.xml");
    String xslFile = application.getRealPath("feedbacks.xsl");

    File xml = new File(xmlFile);
    File xsl = new File(xslFile);

    if (!xsl.exists()) {
        out.println("<h3>Error: feedback.xsl not found at " + xsl.getAbsolutePath() + "</h3>");
    } else if (!xml.exists()) {
        out.println("<h3>Error: feedback.xml not found at " + xml.getAbsolutePath() + "</h3>");
    } else {
        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer transformer = factory.newTransformer(new StreamSource(xsl));
        transformer.transform(new StreamSource(xml), new StreamResult(out));
    }
%>
