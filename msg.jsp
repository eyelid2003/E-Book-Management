<%
String msg1=(String)session.getAttribute("sucess");
String msg2=(String)session.getAttribute("failed");
String msg3=(String)session.getAttribute("error");

if(msg1 != null){
%>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong><%= msg1 %></strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    session.removeAttribute("sucess");

}
else if(msg2 != null){
%>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong><%= msg2 %></strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    session.removeAttribute("failed");
}
else if(msg3 != null){
%>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
    <strong><%= msg3 %></strong>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
</div>
<%
    session.removeAttribute("error");
}

%>
