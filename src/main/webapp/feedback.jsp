<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>IceCream Heaven | Feedback</title>
  <link rel="stylesheet" href="style.css">
  <link rel="icon" type="image/png" href="images/ice-cream.png">

  <script>
   
    function submitFeedback(event) {
      event.preventDefault(); 

     
      const name = document.querySelector("input[name='name']").value;
      const email = document.querySelector("input[name='email']").value;
      const rating = document.querySelector("input[name='rating']").value;
      const comments = document.querySelector("textarea[name='comments']").value;

      const xhr = new XMLHttpRequest();
      xhr.open("POST", "AddFeedback.jsp", true);
      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

      xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
          document.getElementById("responseMsg").innerHTML =
            "<p style='color:green;'>Feedback submitted successfully!</p>";
          document.querySelector(".contact-form").reset();
        }
      };

      xhr.send(
        "name=" + encodeURIComponent(name) +
        "&email=" + encodeURIComponent(email) +
        "&rating=" + encodeURIComponent(rating) +
        "&comments=" + encodeURIComponent(comments)
      );
    }
  </script>
</head>
<body>
  <header>
    <nav class="navbar">
      <h1 class="logo">IceCream Heaven</h1>
      <ul class="nav-links">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="menu.jsp">Menu</a></li>
        <li><a href="about.jsp">About</a></li>
        <li><a href="feedback.jsp">Feedback</a></li>
        <%
          Integer userId = (Integer) session.getAttribute("userId");
          if (userId == null) {
        %>
          <li><a href="login.jsp">Login</a></li>
          <li><a href="register.jsp">Register</a></li>
        <%
          } else {
        %>
          <li><a href="LogoutServlet">Logout</a></li>
        <%
          }
        %>
      </ul>
    </nav>
  </header>

  <section class="contact-page">
    <h2>Give Us Your Feedback</h2>
    
    <form class="contact-form" onsubmit="submitFeedback(event)">
      <input type="text" name="name" placeholder="Your Name" required>
      <input type="email" name="email" placeholder="Your Email" required>
      <input type="number" name="rating" placeholder="Rating (1-5)" min="1" max="5" required>
      <textarea name="comments" placeholder="Your Feedback" rows="5" required></textarea>
      <button type="submit" class="btn">Submit Feedback</button>
    </form>

    <div id="responseMsg"></div>

    <div class="contact-info">
      <p>Please leave honest feedback </p>
    </div>
  </section>

  <footer>
    <p> IceCream Heaven | Stay Cool </p>
  </footer>
</body>
</html>
