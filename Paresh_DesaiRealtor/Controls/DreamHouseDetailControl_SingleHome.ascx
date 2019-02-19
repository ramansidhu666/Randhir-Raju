<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DreamHouseDetailControl_SingleHome.ascx.cs" Inherits="Property.Controls.DreamHouseDetailControl_SingleHome" %>

<%--<%@ Register TagName="GoogleMap" TagPrefix="uc" Src="~/Controls/GoogleMap.ascx" %>
<%@ Register TagName="PropertySearch" TagPrefix="uc" Src="~/Controls/PropertySearch.ascx" %>
<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<link href="../css/style_002.css" rel="stylesheet" />
<link href="../slider/css/style.css" rel="stylesheet" />

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
<script src="//cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
<div class="container">
	
</div> <!-- container / end -->
    <div id="printarea left_section_slider_new_demo" class="cndos_inner_bg">
        
           <div class=" ">
		<div class='list-group gallery'>
             <asp:Repeater ID="rptGallary" runat="server">
                               
                                <ItemTemplate>
                                    <div class='col-sm-4 col-xs-6 col-md-3 col-lg-3'>
                <a class="thumbnail fancybox" rel="ligthbox" href="/admin/Single_homes/<%# Eval("ImageUrl") %>">
                    <img class="img-responsive" alt="" src="/admin/Single_homes/<%# Eval("ImageUrl") %>" />
                   <%-- <div class='text-right'>
                        <small class='text-muted'><%# Eval("Title") %></small>
                    </div> <!-- text-right / end -->--%>
                </a>
            </div> <!-- col-6 / end -->
                                </ItemTemplate>
                            </asp:Repeater>
           
           
           
        </div> <!-- list-group / end -->
	</div> <!-- row / end -->
     
            <div class="cls_tab_cntent_prprty_dtl">
               
              <div class="col-md-12 col-sm-12">
               
                <div class="property_inner_cntnt">
                     <h2>
                    <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>&nbsp</h2>
                     <h2>
                    <asp:Label ID="lblPrice" runat="server" Text="" CssClass="cnstrctn_deatil_price"></asp:Label>&nbsp</h2>
                 
                    <div class ="construction_detail"><asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>&nbsp</div>
                    
                </div>
            </div>
            

                    <div class="detail_left_section_new2">
                        <div>
                            <h2></h2>
                            <asp:Label ID="lblSubTypeofhome" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblStorey" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblDirCrossSt" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblMLS1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblfronting" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblBedroom" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblWashRooms" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblBasement1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblHeat1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblApxAge1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblWater1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblSewers1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblGarageTypes1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblParking1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblKitchen" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblfamilyrm" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblBasement" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblExterior" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblGarageType" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblParking" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblPool" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblWater" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblSewers" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblSpecificDesignation" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="LblParkingInc" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblBalcony" runat="server" Text=""></asp:Label>&nbsp
                        </div>
                    </div>
                        </div>
                  <div class="col-md-12 col-sm-12">
                  <div class="construction_intrested_hdng">
                  <h2>I am Interested</h2>
                  </div>
                <div class="rocco_cntct_info_profile">
                    <div class="col-md-4 col-sm-4">
                        <div class="roco_pro_img">
                            <img src="../images/client_img.png" />

                        </div>
                           <div class="roco_pro_info">
                           <%-- <h2>
                                Randhir Dhaliwal & Gurwinder
                               <%-- <asp:Label ID="lblname" runat="server"></asp:Label></h2>--%>
                            <%--<p>Sales Representative</p>--%>
                            <%--<asp:Label CssClass="email_profile_r" ID="lblemail" runat="server"></asp:Label>--%>
                            <%--<span class="email_profile_r">519-729-2778</span>--%>
                            <%--<asp:Label CssClass="email_profile_r" ID="lblmobile" runat="server"></asp:Label>--%>
                        </div>
                    </div>

                    <div class="col-md-8 col-sm-8">
                        <div class="roco_cnts_us">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                            <div class="agent_input_prprty_dtl">
                                <p>First Name:</p>
                                <asp:RequiredFieldValidator ID="reqFirstName" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtFirstName" ValidationGroup="SaveContactInfo" ForeColor="Red"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtFirstName" CssClass="CTextBox" runat="server" PlaceHolder="First Name" MaxLength="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtFirstName" ErrorMessage="FirstName required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ControlToValidate="txtFirstName" ErrorMessage="Only alphabets are allowed"
                                    ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                            </div>
                                     </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="agent_input_prprty_dtl">
                                        <p>
                                            Last Name:
                                        </p>
                                        <asp:RequiredFieldValidator ID="reqLastName" runat="server" ErrorMessage="*" ControlToValidate="txtLastName"
                                            ValidationGroup="SaveContactInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                                        <asp:TextBox ID="txtLastName" CssClass="CTextBox" MaxLength="20" runat="server" PlaceHolder="Last Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtLastName" ErrorMessage="LastName required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                            ControlToValidate="txtLastName" ErrorMessage="Only alphabets are allowed"
                                            ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                </div>
                            <div class="row">
                                   <div class="col-md-6 col-sm-6">
                            <div class="agent_input_prprty_dtl">
                                <p>
                                    E-mail:
                                </p>
                                <asp:TextBox ID="txtEmail" CssClass="CTextBox" runat="server" PlaceHolder="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="EmailID required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rgeEmail" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                            </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="agent_input_prprty_dtl">
                                        <p>
                                            Phone Number:   
                                        </p>
                                        <asp:TextBox ID="txtPhoneno" CssClass="CTextBox" runat="server" PlaceHolder="Phone Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtPhoneno" ErrorMessage="Phone No. required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regPhone" ValidationGroup="DreamHome" runat="server" ControlToValidate="txtPhoneno"
                                            ValidationExpression="^(\(\d{3}\) \d{3}-\d{4}|\d{3}-\d{3}-\d{4}|\d{10})$"
                                            Text="Enter a valid phone number" Display="Dynamic" ForeColor="Red" />
                                    </div>
                                </div>
                            </div>
                             <div class="row">
                                  <div class="col-md-12 col-sm-12">
                            <div class="agent_input_prprty_dtl">
                                <p>
                                    Message
                                </p>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtMessage" ValidationGroup="SaveContactInfo" ForeColor="Red"
                                    Display="Dynamic"></asp:RequiredFieldValidator>

                                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Height="90px" PlaceHolder="Message"></asp:TextBox>
                            </div>
                                 </div>
                                 </div>

                            <div class="row">
                                 <div class="col-md-12 col-sm-12">
                                <div class="agent_input_prprty_dtl_3">
                                    <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
                                    <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="Sendbutton" Width="24%"
                                        UseSubmitBehavior="false" ValidationGroup="SaveContactInfo" OnClick="btnSend_Click" />
                                </div>
                                     </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
                    </div>

     
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

