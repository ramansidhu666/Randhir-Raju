<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="GallaryPage.aspx.cs" Inherits="Property.GallaryPage" %>

<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper_new">
          <div class="row landing_page_p_pge">
        
        </div>
    </div>
  <%--  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>--%>


<!-- References: https://github.com/fancyapps/fancyBox -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
<script src="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>

<div class="container">
	<div class="row">
		<div class='list-group gallery'>
             <asp:Repeater ID="rptGallary" runat="server">
                               
                                <ItemTemplate>
                                    <div class='col-sm-4 col-xs-6 col-md-3 col-lg-3'>
                                        <div class="gallry_bg">
                <a class="thumbnail fancybox" rel="ligthbox" href="/admin/Gallary/<%# Eval("ImageUrl") %>">
                    <img class="img-responsive" alt="" src="/admin/Gallary/<%# Eval("ImageUrl") %>" />
                    <div class='gllery_box'>
                        <small class='text-muted'><%# Eval("Title") %></small>
                    </div> <!-- text-right / end -->
                </a>
                 </div>
            </div> <!-- col-6 / end -->
                                </ItemTemplate>
                            </asp:Repeater>
           
           
           
        </div> <!-- list-group / end -->
	</div> <!-- row / end -->
</div> <!-- container / end -->
    <script type="text/javascript">
    $(document).ready(function () {
        //FANCYBOX
        //https://github.com/fancyapps/fancyBox
        $(".fancybox").fancybox({
            openEffect: "none",
            closeEffect: "none"
        });
    });


</script>
</asp:Content>
