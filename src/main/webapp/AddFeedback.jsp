<%@ page import="javax.xml.parsers.*,org.w3c.dom.*,javax.xml.transform.*,javax.xml.transform.dom.DOMSource,javax.xml.transform.stream.StreamResult,java.io.*" %>
<%
    String file = application.getRealPath("ice_cream.xml");
    File xmlFile = new File(file);

    DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
    DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
    Document doc;

    if (!xmlFile.exists()) {
       
        doc = dBuilder.newDocument();
        Element root = doc.createElement("feedbacks");
        doc.appendChild(root);
    } else {
       
        doc = dBuilder.parse(xmlFile);
        doc.getDocumentElement().normalize();
    }

    Element root = doc.getDocumentElement();
    Element feedback = doc.createElement("feedback");

    Element nameEl = doc.createElement("name");
    nameEl.appendChild(doc.createTextNode(request.getParameter("name")));
    feedback.appendChild(nameEl);

    Element emailEl = doc.createElement("email");
    emailEl.appendChild(doc.createTextNode(request.getParameter("email")));
    feedback.appendChild(emailEl);

    Element ratingEl = doc.createElement("rating");
    ratingEl.appendChild(doc.createTextNode(request.getParameter("rating")));
    feedback.appendChild(ratingEl);

    Element commentsEl = doc.createElement("comments");
    commentsEl.appendChild(doc.createTextNode(request.getParameter("comments")));
    feedback.appendChild(commentsEl);

    root.appendChild(feedback);


    TransformerFactory transformerFactory = TransformerFactory.newInstance();
    Transformer transformer = transformerFactory.newTransformer();
    DOMSource source = new DOMSource(doc);
    StreamResult result = new StreamResult(xmlFile);
    transformer.transform(source, result);

    out.println("<h3>Feedback added successfully!</h3>");
    out.println("<a href='ShowFeedback.jsp'>View All Feedback</a>");
%>
