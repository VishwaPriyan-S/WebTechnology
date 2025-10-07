<%@ page import="javax.xml.parsers.*,org.w3c.dom.*,javax.xml.xpath.*,java.io.*" %>
<html>
<head>
    <title>Feedback with Rating > 3</title>
</head>
<body>
<h2>Feedback with Rating greater than 3</h2>

<%
    try {
        File xmlFile = new File(application.getRealPath("ice_cream.xml"));

        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
        Document doc = dBuilder.parse(xmlFile);
        doc.getDocumentElement().normalize();

        XPath xPath = XPathFactory.newInstance().newXPath();
        String expression = "/feedbacks/feedback[rating>3]";  
        NodeList nodeList = (NodeList) xPath.compile(expression).evaluate(doc, XPathConstants.NODESET);

        if (nodeList.getLength() == 0) {
            out.println("<p>No feedback found with rating greater than 3.</p>");
        } else {
            out.println("<table border='1' cellpadding='5'>");
            out.println("<tr><th>Name</th><th>Email</th><th>Rating</th></tr>");

            for (int i = 0; i < nodeList.getLength(); i++) {
                Element fb = (Element) nodeList.item(i);

                String name = fb.getElementsByTagName("name").item(0) != null ? fb.getElementsByTagName("name").item(0).getTextContent() : "";
                String email = fb.getElementsByTagName("email").item(0) != null ? fb.getElementsByTagName("email").item(0).getTextContent() : "Not provided";
                String rating = fb.getElementsByTagName("rating").item(0) != null ? fb.getElementsByTagName("rating").item(0).getTextContent() : "0";

                out.println("<tr>");
                out.println("<td>" + name + "</td>");
                out.println("<td>" + email + "</td>");
                out.println("<td>" + rating + "</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</body>
</html>
