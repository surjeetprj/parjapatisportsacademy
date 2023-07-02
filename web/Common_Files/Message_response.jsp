 <%@page import="com.e.sports.entities.Message"%>
<%     Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div id ="msgid" class=" alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <% session.removeAttribute("msg");
          }%>      
         <!-- JavaScript code to hide message after 30 seconds..-->
        <script type="text/javascript">
            setTimeout ("doSomething()", 6000);
                    function doSomething(){
                    let msg = document.getElementById('msgid');
                            msg.style.display = "none";
                    }
        </script>