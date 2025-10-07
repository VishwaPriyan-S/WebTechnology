<%@ page import="org.w3c.dom.*, javax.xml.parsers.*, java.io.*" %>
<%
    String email = request.getParameter("email");
    boolean exists = false;

    try {
        String file = application.getRealPath("ice_cream.xml");
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = dbf.newDocumentBuilder();
        Document doc = db.parse(new File(file));

        NodeList feedbacks = doc.getElementsByTagName("feedback");
        for (int i = 0; i < feedbacks.getLength(); i++) {
            Element fb = (Element) feedbacks.item(i);
            String storedEmail = fb.getElementsByTagName("email").item(0).getTextContent();
            if (storedEmail.equalsIgnoreCase(email)) {
                exists = true;
                break;
            }
        }
    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    }

    if (exists) {
        out.print("<span style='color:red'>Email already used for feedback </span>");
    } else {
        out.print("<span style='color:green'>Email available </span>");
    }
%>
