<%@ Page Title="" Language="C#" MasterPageFile="~/HomeMaster.Master" AutoEventWireup="true" EnableViewState="false" CodeBehind="Home.aspx.cs" Inherits="Property.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <style>
    .nav-tabs {
    margin-bottom: 15px;
}
.sign-with {
    margin-top: 25px;
    padding: 20px;
}
div#OR {
    height: 30px;
    width: 30px;
    border: 1px solid #C2C2C2;
    border-radius: 50%;
    font-weight: bold;
    line-height: 28px;
    text-align: center;
    font-size: 12px;
    float: right;
    position: absolute;
    right: -16px;
    top: 40%;
    z-index: 1;
    background: #DFDFDF;
}
body.modal-open {
   overflow-y: hidden !important;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <button id="btnModal"  type="button" style="visibility:hidden"  class="btn btn-info btn-lg"  data-toggle="modal" data-target="#myModalNew" data-backdrop="static" data-keyboard="false">Open Modal</button>
    
  <div class="modal fade" id="myModalNew" role="dialog">
      <div class="modal-backdrop fade in"></div>
      <div class="modal-dialog respo_mdl">
        <div class="modal-content mdl_brder">
            <div class="modal-header hder_mdal">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    ×</button>
                <h4 class="modal-title" id="myModalLabel">
                   To Access VIP Listings <br /> Please fill the Inforamtion</h4>
            </div>
            <div class="modal-body bdy_mdl_clr">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Nav tabs -->
                       <%-- <ul class="nav nav-tabs">
                           
                            <li class="active"><a href="#Registration" data-toggle="tab">Registration</a></li>
                             <li ><a href="#Login" data-toggle="tab">Login</a></li>
                        </ul>--%>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane modl_bg_2" id="Login">
                                <form role="form" class="form-horizontal">
                                 <div class="form-group modl_ln2">
                                   <div class="">
                                        <input type="email" class="form-control" id="EmailLogin" placeholder="Email" />
                                        <label class="red_clrrr" id="errEmailLogin"></label>
                                    </div>
                                </div>
                                <div class="form-group modl_ln2">
                                  <div class="">
                                        <asp:TextBox ID="txtPhoneLogin" CssClass="CTextBox form-control"  runat="server" PlaceHolder="Phone Number"></asp:TextBox>
           

                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1"  ValidationGroup="FreeHome" runat="server" ControlToValidate="txtPhoneLogin"
                                ValidationExpression="^(\(\d{3}\) \d{3}-\d{4}|\d{3}-\d{3}-\d{4}|\d{10})$"
                                Text="Enter a valid phone number" Display="Dynamic"    ForeColor="Red" />
                                       <label class="red_clrrr" id="errPhoneNoLogin"></label>
                                    </div>
                                </div>
                                </form>

                                 <div class="row">
                                    <div class="col-sm-12">
                                       <div class="mdl_btnss">  <button type="button" id="btnLogin" class="btn btn-primary btn-sm mdl_btn_new">Login</button></div>  
                                         <div class="mdl_btnss"> <span> <a href="#Registration" data-toggle="tab">Click here for Registration</a></span></div>
                                    </div>
                                 </div>
                                  <div class="row">
                                        <div class="col-md-12 col-sm-12">
                                            <div class="thnks_msg"> <label id="lblResultLogin"></label></div></div>
                                        </div>
                                    
                            </div>
                            <div class="tab-pane active" id="Registration">
                                <form role="form" class="form-horizontal">
                           
                                <div class="form-group modl_ln">
                                  <div class="col-sm-12">
                                        <input type="text" class="form-control" id="Name" placeholder="Name" />
                                    </div>
                                </div>

                                <div class="form-group modl_ln">
                                    <div class="col-sm-12">
                                        <input type="email" class="form-control" id="Email" placeholder="Email" />
                                        <label class="red_clrrr" id="errEmail"></label>
                                    </div>
                              </div>

                                <div class="form-group modl_ln">
                                   <div class="col-sm-12">
                                        <asp:TextBox ID="txtPhoneno" CssClass="CTextBox form-control" runat="server" PlaceHolder="Phone Number"></asp:TextBox>
           
                                         <asp:RegularExpressionValidator ID="regPhone"  ValidationGroup="FreeHome" runat="server" ControlToValidate="txtPhoneno"
                                ValidationExpression="^(\(\d{3}\) \d{3}-\d{4}|\d{3}-\d{3}-\d{4}|\d{10})$"
                                Text="Enter a valid phone number" Display="Dynamic"    ForeColor="Red" />
                                         <label class="red_clrrr" id="errPhoneNo"></label>
                                    </div>
                                </div>
                               
                                </form>
                                 <div class="row">
                                    <div class="col-sm-12">
                                       <div class="mdl_btnss"> <button type="button" ID="btnRegisteration" class="btn btn-primary btn-sm mdl_btn_new">Save your Detail</button></div>  
                                         <div class="mdl_btnss"> <span>If you already Registered ? <a href="#Login" data-toggle="tab">Click here for Login</a></span></div>
                                    </div>
                                 </div>
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12">
                                            <div class="thnks_msg"> <label id="lblResult"></label></div></div>
                                        </div>
                                       
                            </div>
                        </div>
                        
                    </div>
                   
                </div>
            </div>
        </div>
    </div>

  </div>
 
  
    <script>

        $(window).load(function () {
            var username = '<%= Session["UserId"] %>';
            debugger;
            if (username == '')
            {
                $('#myModalNew').modal({ backdrop: 'static', keyboard: false });
            }
           
        });
        $("#myModalNew").on("show", function () {
            debugger;
            $("body").addClass("modal-open");
        }).on("hidden", function () {
            $("body").removeClass("modal-open")
        });

</script>
<script type="text/javascript">
    function validateEmail(sEmail) {
        var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
        if (filter.test(sEmail)) {
            return true;
        }
    else {
         return false;
    }
    }

    
    $(function () {
        $("#btnRegisteration").click(function () {
            debugger;
            var Name = $("#Name").val();
            var Email = $("#Email").val();
            var PhoneNo = $("#<%=txtPhoneno.ClientID%>").val();
           
            if (jQuery.trim(Email).length <= 0) {
                $('#errEmail').html("Please fill email").addClass("red_clrrr2").removeClass("red_clrrr");
                return false;
            }
            if (!validateEmail(Email))
            {
                $('#errEmail').html("Fill valid email").addClass("red_clrrr2").removeClass("red_clrrr");
                return false;
            }
            if (jQuery.trim(PhoneNo).length <= 0) {
                $('#errPhoneNo').html("Please fill phone no").addClass("red_clrrr2").removeClass("red_clrrr");
                return false;
            }
          
        ;
            
            $.ajax({
                type: "POST",
                url: "Home.aspx/Registeration",
                data: '{Email: "' + Email + '",Name: "' + Name + '",PhoneNo: "' + PhoneNo + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    debugger;
                    if (response.d == "Email already exists.") {
                        $('#lblResult').html(response.d).addClass("red_clrrr2").removeClass("red_clrrr");
                        return false;
                    }
                   // $('#lblResult').html(response.d);
                    $("#Name").val("");
                    $("#Email").val("");
                    $('#errEmail').html("").addClass("red_clrrr").removeClass("red_clrrr2");
                    $('#errEmail').html("").addClass("red_clrrr").removeClass("red_clrrr2");
                    $('#errPhoneNo').html("").addClass("red_clrrr").removeClass("red_clrrr2");
                    $("#<%=txtPhoneno.ClientID%>").val("");
                    $('#myModalNew').modal('hide');
                    location.reload();
                },
                failure: function (response) {
                    //alert(response.d);
                }
            });
        });

        $("#btnLogin").click(function () {
            debugger;
            var Email = $("#EmailLogin").val();
            var PhoneNo = $("#<%=txtPhoneLogin.ClientID%>").val();

            if (jQuery.trim(Email).length <= 0) {
                $('#errEmailLogin').html("Please fill email").addClass("red_clrrr2").removeClass("red_clrrr");
                return false;
            }
            if (!validateEmail(Email)) {
                $('#errEmailLogin').html("Fill valid email").addClass("red_clrrr2").removeClass("red_clrrr");
                return false;
            }
            if (jQuery.trim(PhoneNo).length <= 0) {
                $('#errPhoneNoLogin').html("Please fill phone no").addClass("red_clrrr2").removeClass("red_clrrr");
                return false;
            }

                    ;

            $.ajax({
                type: "POST",
                url: "Home.aspx/Login",
                data: '{Email: "' + Email + '",Name: "' + Name + '",PhoneNo: "' + PhoneNo + '" }',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    debugger;
                    if (response.d == "Invalid email or phone number.")
                    {
                        $('#errEmailLogin').html("").addClass("red_clrrr").removeClass("red_clrrr2");
                        $('#errPhoneNoLogin').html("").addClass("red_clrrr").removeClass("red_clrrr2");
                        $('#lblResultLogin').html(response.d).addClass("red_clrrr2").removeClass("red_clrrr");
                    }
                    else
                    {
                        $("#Email").val("");
                        $("#<%=txtPhoneno.ClientID%>").val("");
                        $('#myModalNew').modal('hide');
                        location.reload();
                    }
                    

                },
                failure: function (response) {
                    //alert(response.d);
                }
            });
                });
    });
    </script>
    </asp:Content>
